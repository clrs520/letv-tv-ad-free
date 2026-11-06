---
name: letv-tv-ad-free
description: Remove boot ads, recommendation panels, telemetry and the sideload install-lock from LeTV / Mstar-based Android TVs (Android 4.x–6.x, kernel ≤4.8) over ADB, using a Dirty Cow privilege escalation and an init-hook persistence layer. Use when the user wants to de-ad, debloat or unlock sideloading on their own old LeTV/EUI or similar Mstar TV.
---

# LeTV / Mstar TV Ad Removal & Liberation

Target class: LeTV Super TV (超3/超4 series, EUI 5.x, Android 4.3–6.0, Mstar 6A9xx chipset) and
similar Mstar-based Chinese TVs, reached via `adb connect <TV_IP>:5555` on the LAN.

Verified working on: LeTV 超4 X4-50, EUI V2401RCN02C080080B04121S, Android 6.0, kernel 3.10.86,
user build, SELinux **Disabled**, no root, 2026-11.

Everything happens on `/data` (+ one read-only-locked file). `/system` is **never** modified.

## Hard constraints learned the hard way (read first)

1. **Never remount /system read-write.** On these TVs `mount -o remount,rw /system` instantly
   panics/reboots the box (kernel-grade tamper guard). All work must stay on `/data` and
   `/tvconfig` (the latter CAN be remounted safely).
2. **Dirty Cow edits live in the page cache only.** They vanish on reboot. Workflow must be:
   cow the file → *execute it in the same boot* → restore original bytes via a second cow run.
3. **Never delete the boot ad video** (`/tvconfig/video.ts` or fastplay slots). The display
   pipeline (`hwcomposer`) waits for `mstar.videoadvert.finished` which is only set after a video
   plays. Missing video = risk of permanent black screen at boot. **Replace** with a short valid
   clip instead.
4. **Payload size must be ≤ the cow target file size.** Overwriting writes past EOF into the page
   (harmless on disk) but breaks verification and the tail of your script may be truncated.
   Always hard-check size before pushing.
5. **`pm disable` does not kill running processes** on EUI. Follow disables with
   `am force-stop <pkg>`; if the app is persistent and restarts, `kill -9` via a
   `/proc/*/cmdline` scan.
6. **A blocked PackageInstallerActivity is a zombie task.** `am start` only brings it to the
   front without re-running the decision. Always `am force-stop com.android.packageinstaller`
   before retesting an install.
7. **`iptables -m string` hangs forever** on this kernel (xt_string). Use IP-based rules with
   boot-time dynamic DNS resolution instead.
8. **NDK-built binaries are rejected by the old bionic linker** ("TLS segment is underaligned").
   Build freestanding: `clang -O2 -nostdlib -static`.
9. Git Bash on Windows: prefix adb commands having remote absolute paths with
   `MSYS_NO_PATHCONV=1`; pass local paths as `C:/...`.
10. ADB-over-WiFi is flaky on these boxes: wrap every read in a small retry loop, prefer
    `adb pull` over `cat` for anything larger than ~1 KB, and never trust a silent empty result.

## Phase 0 — Preflight

```bash
adb connect TV_IP:5555
adb shell getprop ro.product.brand ro.product.model ro.build.version.release   # identify
adb shell cat /proc/version                                                    # kernel
adb shell getenforce                                                           # SELinux
adb shell "su -c id"                                                           # root? (usually absent)
```

Proceed only if: kernel in 2.6.22–4.8.x (Dirty Cow range), and you own the device.
Check the *actual* network path first (`svc wifi disable` may be a no-op if the TV is on
Ethernet — the recommendation block must then use iptables, not WiFi toggling).

## Phase 1 — Locate the ad mechanism

```bash
adb shell "strings /system/bin/bootanimation | grep -E 'video|\.ts|bootvideo'"
adb shell "find /tvconfig /data/fastplay -type f \( -name '*.ts' -o -name '*.xml' \) 2>/dev/null"
adb shell "cat /data/fastplay/dateconf.xml"   # LeTV: date → ad-file rotation map (root dir, needs the Phase-2 payload to read)
```

LeTV layout discovered: boot video = first of `/data/video/video.ts`, then
`/data/fastplay/ordinary/ad_1..7.ts` (daily rotation, `dateconf.xml`, per-slot `ad_N.xml` with
`<md5>`+`<duration>` the player validates), fallback `/tvconfig/video.ts`. The Android-layer ad
manager (`com.stv.bootadmanager`) is usually already dead — the CDN is not.

## Phase 2 — Dirty Cow root via an init property trigger

**Find a root-executed script you can reach.** On EUI, `setprop letv.copy.logs.res 1` (settable
from adb shell) makes init run `/system/bin/copy_logs_res.sh` as root:

```bash
adb shell "setprop letv.copy.logs.res 1; sleep 3; dmesg | grep copylogsres"
#   init: Starting service 'copylogsres'...  ← vector confirmed
```

Generic discovery: `dmesg | grep 'init: Starting service'` → enumerate services → find ones
backed by shell scripts (`/system/bin/*.sh`) whose triggers you can fire. Verify by an
observable side effect (the stock script copies logs to /reserved).

**Build the exploit** (see `scripts/build_exploit.sh`): produces a ~3 KB static aarch64 binary.

**Cow workflow** (payload ≤ target size, hard-checked):

```bash
MSYS_NO_PATHCONV=1 adb push cow <payload.sh> /data/local/tmp/
adb shell chmod 755 /data/local/tmp/cow
adb shell /data/local/tmp/cow /data/local/tmp/payload.sh /system/bin/copy_logs_res.sh   # prints COW-OK
adb shell setprop letv.copy.logs.res 0; adb shell setprop letv.copy.logs.res 1          # fire
# ... payload does the work as root ...
adb shell /data/local/tmp/cow /data/local/tmp/orig444.sh /system/bin/copy_logs_res.sh   # restore original bytes
```

A good payload writes evidence to `/data/local/tmp/*.txt` (chmod 644) — root-owned 0600 files
are unreadable by shell and make verification ambiguous.

## Phase 3 — Boot ad replacement

```bash
ffmpeg -loop 1 -framerate 24 -i boot0.jpg -i boot0.mp3 -t 0.4 \
  -c:v libx264 -profile:v high -pix_fmt yuv420p -s 1920x1072 \
  -c:a aac -b:a 128k -ar 44100 -ac 2 -f mpegts short.ts
```

Match the original stream parameters (probe the original with ffprobe). 0.44 s is the verified
floor — shorter risks the "no video" branch and a black boot. Replace **every** fastplay slot
plus `/tvconfig/video.ts` (remount it rw, cp, chown system:system, chmod 644, remount ro), fix
each `ad_N.xml` (`<md5>` → new hash, `<duration>` → clip length), keep `*.bak` of originals.

## Phase 4 — Persistence hook (survives reboot, no /system writes)

Find a root daemon that executes a file from writable storage. On EUI, `/system/bin/kdmStart.sh`
(runs as root at every boot, in a loop) executes `/data/media/kdmConfig/upgrade/update.sh` with
**no signature check**, then deletes the directory. Deploy a self-healing hook:

1. Keep the real script at `/data/local/tmp/tvfix.sh` (persistent).
2. Bootstrap once (root payload): `mkdir -p .../upgrade && cp tvfix.sh .../update.sh && chmod 755` and run it.
3. The hook re-copies itself into the upgrade dir from a detached `sleep 5` subshell, so
   kdmStart's `rm -r` cannot kill it permanently.

See `scripts/tvfix.template.sh` for the full hook (boot-ad self-heal, IP/DNS blocking,
splash/shutdown/screensaver wipes, install-lock enforcement).

## Phase 4b — Desktop replacement (Aerial, `app.orchard.tv`)

The stock LeTV desktop (`com.stv.deskplatform`) is ad-laden and dies with the LeTV cloud.
Replace it with the **Aerial** launcher (`app.orchard.tv`, v1.85 verified): aerial video
wallpaper, clock/weather, Apple-TV-style aerial screensaver (`assets/aerials.json`), a clean
app row that automatically reflects the debloated package list, and a boot self-guard
(`.guard.RevivalListener` + RECEIVE_BOOT_COMPLETED).

Backup from an already-configured TV, then install anywhere:

```bash
# on the source TV (the apk lives in /data/app):
adb shell pm path app.orchard.tv          # /data/app/app.orchard.tv-2/base.apk
MSYS_NO_PATHCONV=1 adb pull /data/app/app.orchard.tv-2/base.apk aerial.apk

# on the target TV (adb install bypasses the install lock entirely):
adb install -r aerial.apk
adb shell "am start -a android.intent.action.MAIN -c android.intent.category.HOME"
#    the resolver appears → pick Aerial → "always"
```

Notes:
- Verify HOME with `adb shell dumpsys window | grep mCurrentFocus` after pressing HOME —
  it must show `app.orchard.tv/.MainActivity`.
- If the stock desktop ever hijacks HOME back, re-select via the same chooser, or
  `pm disable com.stv.deskplatform` (reversible; the remote's 信号源 key is served by the
  independent `com.stv.signalsourcemanager` and keeps working either way).
- The launcher label is just "Aerial"; the first HOME press on a fresh EUI may flash the LeTV
  desktop before the chooser — pick Aerial + always once and it sticks (its boot guard
  re-asserts it on every boot).

## Phase 5 — Ad surfaces & telemetry

- Wipe `/data/fastplay/{shutdown,screensaver,videoscreensaver}/*` (stale ad configs).
- Un-arm app splash ads: `/data/fastplay/.admanager/SplashAppList/*` (per-app 0-byte markers).
- Telemetry: block MMA/AdMaster/Nielsen-class domains with **static IPs + boot-time
  `nslookup` resolution** via iptables OUTPUT REJECT (see template section C). The ARK/MMA SDK
  hosts on these TVs: `com.stv.voice`, `com.letv.android.tv.letvlive`, `com.stv.litemode`
  (`app_ark_mma_storage/sdkconfig.xml` in their data dirs).

## Phase 6 — Sideload install lock

Symptom: normal installs show "此应用存在安全隐患…已禁止安装" while `adb install` works (adb
skips package verification by default).

Chain (decompiled): `PackageInstallerActivity` → `InstallUtil.isInBlackList` →
`TvMasterManager.checkPermission(pkg, flag)` (binder) → hosted by **`com.stv.helper.service`**
(find the host with a `/proc/*/maps` probe for the service's lib) → verdict from
`/data/data/com.stv.helper.service/databases/tvmaster.db`, table `applevel`
(`package_name, signature, value="authId:flag,..."`; authority id 1 = 禁止安装).

Fix: sanitize (`scripts/sanitize_tvmaster.py`: token-safe `1:1` → `1:0`, never blind REPLACE —
`11:1` contains `1:1`), push back, kill the helper so it reloads, then **lock the file**:

```bash
chown root:root tvmaster.db && chmod 400 tvmaster.db
kill -9 $(grep -l com.stv.helper.service /proc/[0-9]*/cmdline 2>/dev/null | sed "s|[^0-9]||g")
```

Unreadable DB → `checkPermission` throws → the installer's catch-all returns "not blacklisted"
→ every install allowed. Root-owned 400 means the cloud can never re-push the blacklist. The
helper runs fine without the DB (verified, no crash loop). `service check tvmaster.service`
must report **not found** afterwards.

Debug traps: disabling the store/daemon does not kill the verdict (the helper hosts it);
a blocked installer is a zombie task (force-stop before retest); deleting your test APK yields
a misleading 解析错误 dialog.

## Phase 7 — Verify & roll back

- Boot: `getprop mstar.videoadvert.finished` must be `1`.
- Desktop: pressing HOME must land on `app.orchard.tv/.MainActivity` (dumpsys window mCurrentFocus).
- Install: full UI flow of a real APK completes.
- `/system/bin/copy_logs_res.sh` sha256 must equal the stock backup you took first.
- Rollback = `pm enable <pkg>`, restore `*.bak` files, remove the kdm upgrade dir, unlock the db
  (`chown system:system`, `chmod 660`), remove `/data/local/tmp/tvfix.sh`.

## Scars (do not re-learn these)

| Action | Result |
|---|---|
| `mount -o remount,rw /system` | instant reboot (tamper guard) |
| Trusting cow edits after reboot | edits are gone (page cache only) |
| Payload bigger than target | silent truncation + infinite verify loop |
| `pm disable` alone | process survives, service still registered |
| Retesting install without force-stopping installer | same zombie dialog, false negative |
| `iptables -m string` | hangs the netfilter thread |
| NDK default build on old bionic | TLS alignment rejection → use `-nostdlib` |
| Deleting the boot video | hwcomposer waits forever → black screen risk |

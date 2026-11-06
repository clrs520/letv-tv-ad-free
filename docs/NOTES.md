# Reverse-engineering notes — LeTV EUI (超4 X4-50, Android 6.0, Mstar)

Findings from the 2026-11 session, useful as a map for sibling devices.
All paths/properties are the TV's own; nothing here is needed from the vendor.

## 1. Boot ad architecture (three layers)

```
power → MBoot (static logo /tvconfig/boot0.jpg, cmdline BOOTLOGO_IN_MBOOT)
      → Android init
      → bootanimation (LeTV-modified /system/bin/bootanimation):
            1. /data/video/video.ts          (downloaded slot — absent in practice)
            2. /data/fastplay/ordinary/ad_1..7.ts   (daily rotation — see dateconf.xml)
            3. /tvconfig/video.ts            (factory ad, 15 s, baked 2019-04-12)
      → hwcomposer holds the UI until mstar.videoadvert.finished=1
      → launcher
```

- The rotation config is `/data/fastplay/dateconf.xml` (date → `ad_N.xml`); each
  `ad_N.xml` carries `adpath`, `<md5>` (validated), `<duration>` (seconds the player
  waits), `<skip>`, and a VAST pointer. The downloader (乐视 CDN, still half alive)
  refreshes these.
- The Android-layer ad manager `com.stv.bootadmanager` is usually already
  uninstalled for user 0 and is irrelevant to what you see.
- `pm list packages -d` shows packages a previous owner/service already disabled —
  `pm disable` on those fails with "not installed for user"; that is fine.
- `/data/fastplay/` also holds `shutdown/` (power-off ads), `screensaver/` +
  `videoscreensaver/` (poster/video screensaver ads) and `.admanager/`
  (`SplashAppList` = per-app splash-ad markers; MMA/ARK tracking data).

## 2. Root without root — the init property trigger

SELinux is Disabled but there is no su. The privilege vector is an **init service
that runs a shell script as root on a property trigger**:

- `setprop letv.copy.logs.res 1` (adb shell may set it) → init starts service
  `copylogsres` → runs `/system/bin/copy_logs_res.sh` as root (400 bytes).
- Verify via `dmesg | grep copylogsres` → `init: Starting service 'copylogsres'...`.
- Combine with Dirty Cow (CVE-2016-5195; kernel 3.10.86 here is unpatched): rewrite
  the script's *content* in the page cache (file size unchanged), fire the property,
  restore the original bytes with a second cow run. Everything within one boot —
  **cow edits do not survive a reboot** (page cache only).

## 3. The sideload install lock

```
PackageInstallerActivity (LeTV-modified)
  → InstallUtil.isInBlackList(ctx, pkg, clientPkg)
      → TvMasterManager.checkPermission(clientPkg, 13) == 1  → allow ("client is store")
      → TvMasterManager.checkPermission(pkg,       1) == 1  → BLOCK ("it is true")
      → any exception → allow  (catch returns false)
  → authority host: com.stv.helper.service  (Java; find it with a /proc/*/maps
    probe for libtvmaster*.so — /system/bin/tvmaster and letvmanager are red herrings)
  → verdict data: /data/data/com.stv.helper.service/databases/tvmaster.db
      table `authority` (id → meaning; id 1 = 禁止安装, id 13 = store-uploader whitelist)
      table `applevel`   (package_name, signature, value="1:1,16:1,..." per app)
```

- The blacklist contains ~67 competitor packages (whole Dangbei family, Shafa,
  third-party launchers/stores, cleaning apps...).
- Cloud re-push channels: `letvmanager` daemon (`getDomain("data")` →
  `http://<domain>/basedata/get?code=TV_NotinstallAPP_Config`, keys baked into the
  store APK) and the store app itself (`setBlackAPPData`).
- Fix: sanitize `1:1`→`1:0` (token-safe!), then `chown root:root` + `chmod 400` the
  db and kill the helper. Unreadable db → every checkPermission throws → installer
  allows everything; the cloud can no longer write. The helper survives without the
  db (no crash loop observed).
- Trap: a blocked installer is a zombie task — `am start` brings it to front without
  re-running the decision. Force-stop `com.android.packageinstaller` before retests.

## 4. Persistence hook

`/system/bin/kdmStart.sh` (root, every boot, loop) runs
`/data/media/kdmConfig/upgrade/update.sh` if present — **no signature check** — then
`rm -r` the directory. Hook = real script at `/data/local/tmp/tvfix.sh`; a detached
`sleep 5` subshell re-copies it back after kdmStart deletes it.

## 5. Misc intelligence

- `pm disable` does not stop running processes; use `am force-stop`, and `kill -9`
  via `/proc/*/cmdline` scan for persistent apps.
- `/proc/<pid>/maps` (as root, via the cow payload) is the fastest way to find which
  process hosts a given binder service library.
- `boot.oat` embeds 16 dex files — carve them by scanning for the `dex\n035` magic
  and reading `file_size` at offset 32; the LeTV framework client classes live in
  the 4.5 MB one (`letv/tvmaster/*`).
- Decompilation toolchain on a China network: aliyun maven thin jars
  (baksmali/dexlib2/util/guava/failureaccess/jcommander) run via
  `java -cp ... org.jf.baksmali.Main deodex x.odex -b boot.oat`.
- `svc wifi disable` is a no-op if the TV is on Ethernet — verify the actual link
  before drawing conclusions from "no network" tests.
- `pm list packages -d` + `dumpsys package <pkg> | grep 'User 0:'` distinguishes
  "disabled" from "uninstalled for user 0" (installed=false).

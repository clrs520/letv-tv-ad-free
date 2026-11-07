#!/system/bin/sh
# LeTV X4-50 ad suppression hook - root, each boot via kdmStart.sh (v7)
# Sections A/E/F/H/I run synchronously (fast, no network/firewall).
# Section J is detached (network watchdog: iptables + DNS re-resolve every 10 min).

# A) boot ad self-heal: 7 fastplay slots + /tvconfig fallback must equal $S
S=/data/local/tmp/short2.ts
M=$(md5sum $S | cut -d' ' -f1)
[ -d /data/fastplay/ordinary ] || { echo no-fastplay-yet; }
for i in 1 2 3 4 5 6 7; do
  F=/data/fastplay/ordinary/ad_$i.ts
  [ -f "$F" ] || continue
  C=$(md5sum $F 2>/dev/null | cut -d' ' -f1)
  if [ "$C" != "$M" ]; then
    cp $S $F
    sed -i "s/<md5>[a-f0-9]*</<md5>$M</" /data/fastplay/ordinary/ad_$i.xml
    sed -i "s/<duration>[0-9]*</<duration>1</" /data/fastplay/ordinary/ad_$i.xml
  fi
done
ls /data/fastplay/ordinary/ad_*.ts >/dev/null 2>&1 && chmod 644 /data/fastplay/ordinary/ad_*.ts 2>/dev/null
[ -f /data/fastplay/ordinary/ad_2.xml ] && cp /data/fastplay/ordinary/ad_2.xml /data/fastplay/adconf.xml 2>/dev/null
T=/tvconfig/video.ts
C=$(md5sum $T 2>/dev/null | cut -d' ' -f1)
if [ "$C" != "$M" ]; then
  mount -o remount,rw /dev/block/platform/mstar_mci.0/by-name/tvconfig /tvconfig
  cp $S $T
  chmod 644 $T
  mount -o remount,ro /dev/block/platform/mstar_mci.0/by-name/tvconfig /tvconfig
fi

# E) splash ad markers + exposure data wipe
rm -f /data/fastplay/.admanager/SplashAppList/* /data/fastplay/.admanager/exposure/* 2>/dev/null
# D) shutdown / screensaver ad configs wipe
rm -f /data/fastplay/shutdown/* /data/fastplay/screensaver/* 2>/dev/null
rm -f /data/fastplay/videoscreensaver/* /data/fastplay/videoscreensaver_bak/* 2>/dev/null
# F) signal source recommendation caches wipe
rm -f /data/data/com.stv.signalsourcemanager/shared_prefs/*cache*.xml

# H) debloat (reversible: pm enable <pkg>)
BLOAT="cn.tvplay.gunworld com.bajintech.karaok com.letv.lekids com.stv.music com.dangbei.dbmusic.letv.tab com.letv.android.tv.letvlive com.letv.leso com.kuyun.stv.androidtv com.stv.android.videochat com.le.lepay.tv sina.mobile.tianqitongstv com.stv.cdeapk com.stv.litemode com.stv.voice com.letv.tvos.appstore letv.remotemanager com.stv.stvpush com.stv.reportlog com.kookong.tv.livematch tvtests.com.mstar.android.tv com.orbbec.TouchCursor com.stv.helper.service"
for p in $BLOAT; do pm disable $p >/dev/null 2>&1; done
# 红线: screenflyter(HOME锚点) 与 appdaemon(开机引导,出厂版) 一律不碰
# 出厂自带开关: debug.screen.state=0 → screenflyter 推广页 onResume 立即 finish()
# （仅 MainActivity 读此属性，实测启动即退、焦点弹回 Aerial；属性重启会重置，故每次开机设置）
setprop debug.screen.state 0

# 红线: signalsourcemanager 的 MainActivity 不可禁用——广播切源必须由它承载
# (禁用后 SignalGlobalReceiver startActivity 崩溃, 切源失效)

# I) install-lock: sanitize then lock the tvmaster policy db root-readonly
F=/data/data/com.stv.helper.service/databases/tvmaster.db
if [ -f /data/local/tmp/tvmaster_clean.db ]; then
  cp /data/local/tmp/tvmaster_clean.db $F
  chown root:root $F 2>/dev/null
  chmod 400 $F 2>/dev/null
  kill -9 $(grep -l com.stv.helper.service /proc/[0-9]*/cmdline 2>/dev/null | sed "s|[^0-9]||g") 2>/dev/null
fi

# G) self-heal: kdmStart deletes the upgrade dir after each run
(sleep 5
mkdir -p /data/media/kdmConfig/upgrade
cp /data/local/tmp/tvfix.sh /data/media/kdmConfig/upgrade/update.sh
chmod 755 /data/media/kdmConfig/upgrade/update.sh) &

# J) network watchdog (detached): apply + re-assert blocking forever.
#    Runs at +45s (netstack settled) then every 10 min. busybox nslookup is
#    mandatory: there is no standalone nslookup on EUI.
(
  sleep 45
  DOMAINS="stargazer-scloud.cp21.ott.cibntv.net picture-scloud.cp21.ott.cibntv.net i3.img.cp21.ott.cibntv.net admaster.com.cn lndata.com miaozhen.com irs01.com cr-nielsen.com nielsenccdata.com imrworldwide.com gridsumdissector.com reachmax.cn tanx.com serving-sys.com doubleclick.net ufs2.cn ulmdb.cn"
  STATIC="111.31.3.239 117.180.232.232 117.180.232.233 111.10.52.132 111.10.52.133"
  apply_rules() {
    for ip in $STATIC; do
      iptables -D OUTPUT -d $ip -j REJECT 2>/dev/null
      iptables -I OUTPUT -d $ip -j REJECT 2>/dev/null
    done
    for h in $DOMAINS; do
      for ip in $(busybox nslookup $h 2>/dev/null | sed -n 's/^Address[^:]*: \(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\).*$/\1/p' | grep -v '^127\.' | sort -u); do
        iptables -D OUTPUT -d $ip -j REJECT 2>/dev/null
        iptables -I OUTPUT -d $ip -j REJECT 2>/dev/null
      done
    done
    # settings self-heal: screenflyter resets these at boot; previous agent's suppressions
    settings put secure screensaver_enabled 0 2>/dev/null
    settings put secure screensaver_activate_on_sleep 0 2>/dev/null
    settings put secure screensaver_activate_on_dock 0 2>/dev/null
    settings put system screen_off_timeout 3600000 2>/dev/null
    settings put global window_animation_scale 0.5 2>/dev/null
    settings put global transition_animation_scale 0.5 2>/dev/null
    settings put global animator_duration_scale 0.5 2>/dev/null
    setprop persist.sys.letv.rtc.poweroff 0 2>/dev/null
    setprop debug.screen.state 0 2>/dev/null
    # fastplay quick re-check (cheap): slots must match the clean clip
    M2=$(md5sum /data/local/tmp/short2.ts 2>/dev/null | cut -d' ' -f1)
    for i in 1 2 3 4 5 6 7; do
      C2=$(md5sum /data/fastplay/ordinary/ad_$i.ts 2>/dev/null | cut -d' ' -f1)
      if [ "$C2" != "$M2" ]; then
        cp /data/local/tmp/short2.ts /data/fastplay/ordinary/ad_$i.ts
        chmod 644 /data/fastplay/ordinary/ad_$i.ts
      fi
    done
  }
  apply_rules
  while true; do sleep 600; apply_rules; done
) &
exit 0

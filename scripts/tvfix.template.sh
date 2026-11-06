#!/system/bin/sh
# LeTV X4-50 ad suppression - root hook, runs each boot via kdmStart.sh
# A) boot ad self-heal: 7 fastplay slots + /tvconfig fallback must equal $S
S=/data/local/tmp/short2.ts
M=$(md5sum $S | cut -d' ' -f1)
for i in 1 2 3 4 5 6 7; do
  F=/data/fastplay/ordinary/ad_$i.ts
  C=$(md5sum $F 2>/dev/null | cut -d' ' -f1)
  if [ "$C" != "$M" ]; then
    cp $S $F
    sed -i "s/<md5>[a-f0-9]*</<md5>$M</" /data/fastplay/ordinary/ad_$i.xml
    sed -i "s/<duration>[0-9]*</<duration>1</" /data/fastplay/ordinary/ad_$i.xml
  fi
done
chmod 644 /data/fastplay/ordinary/ad_*.ts 2>/dev/null
cp /data/fastplay/ordinary/ad_2.xml /data/fastplay/adconf.xml 2>/dev/null
T=/tvconfig/video.ts
C=$(md5sum $T 2>/dev/null | cut -d' ' -f1)
if [ "$C" != "$M" ]; then
  mount -o remount,rw /dev/block/platform/mstar_mci.0/by-name/tvconfig /tvconfig
  cp $S $T
  chmod 644 $T
  mount -o remount,ro /dev/block/platform/mstar_mci.0/by-name/tvconfig /tvconfig
fi
# B) signal source recommendation blocking: static IPs + fresh DNS resolution
for ip in 111.31.3.239 117.180.232.232 117.180.232.233 111.10.52.132 111.10.52.133; do
  iptables -D OUTPUT -d $ip -j REJECT 2>/dev/null
  iptables -I OUTPUT -d $ip -j REJECT
done
# C) telemetry trackers: resolve + block each boot (IP-rotation-proof)
TRACK="admaster.com.cn lndata.com miaozhen.com irs01.com cr-nielsen.com nielsenccdata.com imrworldwide.com gridsumdissector.com reachmax.cn tanx.com serving-sys.com doubleclick.net ufs2.cn ulmdb.cn"
for h in stargazer-scloud.cp21.ott.cibntv.net picture-scloud.cp21.ott.cibntv.net i3.img.cp21.ott.cibntv.net $TRACK; do
  for ip in $(nslookup $h 2>/dev/null | sed -n 's/^Address[^:]*: \(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\).*$/\1/p' | grep -v '^127\.' | sort -u); do
    iptables -D OUTPUT -d $ip -j REJECT 2>/dev/null
    iptables -I OUTPUT -d $ip -j REJECT
  done
done
# D) shutdown / screensaver / video-screensaver ad configs wipe
rm -f /data/fastplay/shutdown/* /data/fastplay/screensaver/* 2>/dev/null
rm -f /data/fastplay/videoscreensaver/* /data/fastplay/videoscreensaver_bak/* 2>/dev/null
# E) app splash ads un-arm + exposure tracking data wipe
rm -f /data/fastplay/.admanager/SplashAppList/* /data/fastplay/.admanager/exposure/* 2>/dev/null
# F) signal source recommendation caches wipe
rm -f /data/data/com.stv.signalsourcemanager/shared_prefs/*cache*.xml
# H) debloat (reversible: pm enable <pkg>)
BLOAT="cn.tvplay.gunworld com.bajintech.karaok com.letv.lekids com.stv.music com.dangbei.dbmusic.letv.tab com.letv.android.tv.letvlive com.letv.leso com.kuyun.stv.androidtv com.stv.android.videochat com.le.lepay.tv sina.mobile.tianqitongstv com.stv.cdeapk com.stv.litemode com.stv.calendar com.stv.feedback com.kookong.tv.livematch tvtests.com.mstar.android.tv com.orbbec.TouchCursor com.stv.voice com.letv.tvos.appstore letv.remotemanager com.stv.stvpush com.stv.reportlog com.stv.helper.service"
for p in $BLOAT; do pm disable $p >/dev/null 2>&1; done
# I) install-lock: tvmaster.db locked root-readonly (cloud cannot re-push; unreadable db -> checkPermission throws -> installs allowed)
F=/data/data/com.stv.helper.service/databases/tvmaster.db
if [ -f /data/local/tmp/tvmaster_clean.db ]; then
  cp /data/local/tmp/tvmaster_clean.db $F
fi
chown root:root $F 2>/dev/null
chmod 400 $F 2>/dev/null
kill -9 $(grep -l com.stv.helper.service /proc/[0-9]*/cmdline 2>/dev/null | sed "s|[^0-9]||g")
# G) self-heal
# G) self-heal: kdmStart deletes the upgrade dir after each run
(sleep 5
mkdir -p /data/media/kdmConfig/upgrade
cp /data/local/tmp/tvfix.sh /data/media/kdmConfig/upgrade/update.sh
chmod 755 /data/media/kdmConfig/upgrade/update.sh) &
exit 0

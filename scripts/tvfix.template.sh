#!/system/bin/sh
# LeTV X4-50 ad suppression hook - root, each boot via kdmStart.sh (v7)
# Sections A/E/F/H/I run synchronously (fast, no network/firewall).
# Section J is detached (network watchdog: iptables + DNS re-resolve every 10 min).

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

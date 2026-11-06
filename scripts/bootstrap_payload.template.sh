#!/system/bin/sh
D=/data/local/tmp/bs2.txt
echo start >$D
mkdir -p /data/media/kdmConfig/upgrade
cp /data/local/tmp/tvfix.sh /data/media/kdmConfig/upgrade/update.sh
chmod 755 /data/media/kdmConfig/upgrade/update.sh
sh /data/media/kdmConfig/upgrade/update.sh
echo done >>$D
chmod 644 $D
sync
exit 0
##################################################################################################################################################
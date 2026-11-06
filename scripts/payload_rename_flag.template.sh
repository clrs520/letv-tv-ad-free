#!/system/bin/sh
D=/data/local/tmp/ni.txt
echo start >$D
F=/data/data/com.android.packageinstaller/shared_prefs/NOTINSTALL.xml
if [ -f $F ]; then
  mv $F $F.bak
  echo "moved:$?" >>$D
else
  echo "no-file" >>$D
fi
chmod 644 $D
sync
exit 0
#############################################################################################################################################################################################################
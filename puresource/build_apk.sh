#!/usr/bin/env bash
# Build puresource.apk (纯净信号源) — no gradle needed.
# Requires: SDK build-tools (aapt/d8/apksigner), platforms;android-3x android.jar, debug keystore.
set -euo pipefail
SDK="${SDK:-$LOCALAPPDATA/Android/Sdk}"
BT="$SDK/build-tools/34.0.0"
AJ="$SDK/platforms/android-35/android.jar"
KS="${KS:-$USERPROFILE/.android/debug.keystore}"

rm -rf bin && mkdir bin
javac -encoding UTF-8 -source 8 -target 8 -classpath "$AJ" -d bin src/com/clrs520/puresource/MainActivity.java
"$BT/aapt.exe" package -f -M AndroidManifest.xml -S res -I "$AJ" -F puresource.unsigned.apk
# the dex entry MUST be named classes.dex at the archive root:
(cd bin && "$BT/aapt.exe" add ../puresource.unsigned.apk classes.dex)
# multi-dex: classes2.dex = the lifted com.stv.signalcommon + com.mstar.tvsettingservice/tvsrvfunc
# client classes from the stock app (PortManager/ChannelManager patched: skipHiddenChannels and
# updateCurrentPortToDB no-op'd — they touch the ACCESS_TV_DATA-gated provider which a normal
# app cannot open). If re-lifting from a stock odex, re-apply patches/PortManager.smali deltas.
if [ -f classes2.dex ]; then "$BT/aapt.exe" add puresource.unsigned.apk classes2.dex; fi
"$BT/apksigner.bat" sign --ks "$KS" --ks-pass pass:android --out puresource.apk puresource.unsigned.apk
unzip -l puresource.apk | grep classes.dex   # verify!
echo "built: puresource.apk — adb install -r puresource.apk"

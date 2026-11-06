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
"$BT/apksigner.bat" sign --ks "$KS" --ks-pass pass:android --out puresource.apk puresource.unsigned.apk
unzip -l puresource.apk | grep classes.dex   # verify!
echo "built: puresource.apk — adb install -r puresource.apk"

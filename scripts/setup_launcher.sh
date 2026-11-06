#!/usr/bin/env bash
# Backup the Aerial launcher (app.orchard.tv) from a configured TV and/or
# install it on a target TV, then trigger the HOME chooser.
#
# usage:
#   setup_launcher.sh backup  <TV_IP>:5555              # pull base.apk -> ./aerial.apk
#   setup_launcher.sh install <TV_IP>:5555 [aerial.apk] # install + HOME chooser
set -euo pipefail

MODE="${1:-}"
SERIAL="${2:-}"
APK="${3:-aerial.apk}"
PKGSRC="/data/app/app.orchard.tv-2/base.apk"   # verify with: adb shell pm path app.orchard.tv

case "$MODE" in
  backup)
    [ -n "$SERIAL" ] || { echo "usage: $0 backup <TV_IP>:5555"; exit 1; }
    MSYS_NO_PATHCONV=1 adb -s "$SERIAL" shell pm path app.orchard.tv
    MSYS_NO_PATHCONV=1 adb -s "$SERIAL" pull "$PKGSRC" "$APK"
    echo "backed up -> $APK (keep this; it sideloads anywhere via adb install)"
    ;;
  install)
    [ -n "$SERIAL" ] || { echo "usage: $0 install <TV_IP>:5555 [aerial.apk]"; exit 1; }
    [ -f "$APK" ] || { echo "apk not found: $APK (run backup first)"; exit 1; }
    adb -s "$SERIAL" install -r "$APK"
    # fire the HOME chooser; pick Aerial -> "always" with the remote
    adb -s "$SERIAL" shell am start -a android.intent.action.MAIN -c android.intent.category.HOME
    sleep 3
    adb -s "$SERIAL" shell dumpsys window | grep mCurrentFocus || true
    echo "if the chooser shows LeTV desktop, select Aerial and mark 'always'."
    echo "verify afterwards: mCurrentFocus must contain app.orchard.tv/.MainActivity"
    ;;
  *)
    echo "usage: $0 backup|install <TV_IP>:5555 [aerial.apk]"; exit 1;;
esac

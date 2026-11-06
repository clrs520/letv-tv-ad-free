#!/usr/bin/env bash
# Build a short replacement boot video from the TV's own static logo + boot jingle.
#
# CRITICAL: match the ORIGINAL ad's stream parameters (probe with ffprobe first).
# On the X4-50: h264 High 1920x1072 yuv420p + AAC LC 44.1kHz stereo, MPEG-TS.
#
# NEVER delete the boot video: hwcomposer waits for mstar.videoadvert.finished which
# is only raised after a video plays. A missing/invalid video risks a black boot.
# 0.4s is the verified floor; shorter clips risk the "no video" branch.
set -euo pipefail

LOGO="${1:-boot0.jpg}"     # pull from TV: /tvconfig/boot0.jpg
AUDIO="${2:-boot0.mp3}"    # pull from TV: /tvconfig/boot0.mp3
OUT="${3:-short.ts}"
DUR="${4:-0.4}"            # verified-safe floor: 0.4

ffmpeg -v error -y -loop 1 -framerate 24 -i "$LOGO" -i "$AUDIO" -t "$DUR" \
  -c:v libx264 -profile:v high -pix_fmt yuv420p -s 1920x1072 \
  -c:a aac -b:a 128k -ar 44100 -ac 2 -f mpegts "$OUT"

ls -la "$OUT"
ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1 "$OUT"
echo "next: push to the TV and replace every fastplay slot + /tvconfig/video.ts,"
echo "then update each ad_N.xml <md5> and <duration> (see tvfix.template.sh)."

#!/bin/bash

# Set your video directory
VIDEO_DIR="$HOME/Videos"

# Get your monitor name (manually set if needed)
MONITOR=$(hyprctl monitors | awk 'NR==1{print $2}')

# Check if mpvpaper is already running and kill it properly
if pgrep -x "mpvpaper" > /dev/null; then
    pkill -TERM -x mpvpaper
    sleep 1  # Ensure the process exits before launching a new one
fi

# Pick a random video
VIDEO=$(find "$VIDEO_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.webm" \) | shuf -n 1)

# Start mpvpaper in the background
nohup mpvpaper "$MONITOR" -o "no-audio loop" --fps=144 "$VIDEO" >/dev/null 2>&1 &
wal -i "$VIDEO" && pywalfox update

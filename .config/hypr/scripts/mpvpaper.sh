#!/bin/bash

# Set your video directory
VIDEO_DIR="$HOME/Videos"

# Get your monitor name
MONITOR=$(hyprctl monitors | awk 'NR==1{print $2}')

# Kill existing mpvpaper process if running
if pgrep -x "mpvpaper" > /dev/null; then
    pkill -TERM -x mpvpaper
    sleep 1
fi

# Pick a random video
VIDEO=$(find "$VIDEO_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.webm" \) | shuf -n 1)

# Start mpvpaper in the background
nohup mpvpaper "$MONITOR" -o "no-audio loop" --fps=144 "$VIDEO" >/dev/null 2>&1 &

# Ensure mpvpaper starts before executing next commands
sleep 2

# Post Command Fixes
wal -i "$VIDEO" -n && pywalfox update && walogram -i "$VIDEO" && "$HOME/.config/wal/hooks.sh"
pkill waybar && { waybar & }
pkill swaync && { swaync & }

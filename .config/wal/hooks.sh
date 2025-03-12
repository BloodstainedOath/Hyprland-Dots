#!/bin/bash

# Get the current wallpaper set by Waypaper
WALLPAPER=$(cat ~/.cache/wal/wal)

# Copy the wallpaper to use as Rofi's background
cp "$WALLPAPER" ~/.config/rofi/images/rofi-bg.png

# (Optional) Create a blurred version for better readability
magick "$WALLPAPER" -blur 0x8 ~/.config/rofi/images/rofi-bg-blur.png

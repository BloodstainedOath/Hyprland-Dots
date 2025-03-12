#!/bin/bash

# Check if playerctl is installed
if ! command -v playerctl &> /dev/null; then
    echo "♫ No music player detected"
    exit 0
fi

# Get player status
STATUS=$(playerctl status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
    ARTIST=$(playerctl metadata artist 2>/dev/null)
    TITLE=$(playerctl metadata title 2>/dev/null)

    if [ -n "$ARTIST" ] && [ -n "$TITLE" ]; then
        echo "♫ $ARTIST - $TITLE"
    elif [ -n "$TITLE" ]; then
        echo "♫ $TITLE"
    else
        echo "♫ Playing"
    fi
elif [ "$STATUS" = "Paused" ]; then
    ARTIST=$(playerctl metadata artist 2>/dev/null)
    TITLE=$(playerctl metadata title 2>/dev/null)

    if [ -n "$ARTIST" ] && [ -n "$TITLE" ]; then
        echo "♫ Paused: $ARTIST - $TITLE"
    elif [ -n "$TITLE" ]; then
        echo "♫ Paused: $TITLE"
    else
        echo "♫ Paused"
    fi
else
    echo "♫ No music playing"
fi

#!/bin/bash

# Get the current player status
status=$(playerctl status 2>/dev/null)
if [ -z "$status" ]; then
    exit 0
fi

# Define the menu options
options="Play/Pause
Next Track
Previous Track
Stop
Volume Up
Volume Down
Seek Forward
Seek Backward"

# Show the menu using wofi
selected=$(echo -e "$options" | wofi --dmenu --width=400 --height=235 --insensitive --print_command --gtk_dark=true --gtk_application_prefer_dark_theme=true --prompt="Media Controls" --location=top --x=0 --y=25)

# Handle the selected option
case $selected in
    "Play/Pause")
        playerctl play-pause
        ;;
    "Next Track")
        playerctl next
        ;;
    "Previous Track")
        playerctl previous
        ;;
    "Stop")
        playerctl stop
        ;;
    "Volume Up")
        playerctl volume 0.1+
        ;;
    "Volume Down")
        playerctl volume 0.1-
        ;;
    "Seek Forward")
        playerctl position 10+
        ;;
    "Seek Backward")
        playerctl position 10-
        ;;
esac 
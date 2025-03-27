#!/usr/bin/env python3

import argparse
import json
import os
import sys
import signal
import gi
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib

def write_output(text, player):
    output = {'text': text,
              'class': 'custom-' + player.props.player_name,
              'alt': player.props.player_name}
    
    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()

def on_play(player, status, manager):
    on_metadata(player, player.props.metadata, manager)

def on_metadata(player, metadata, manager):
    player_name = player.props.player_name
    status = player.props.status
    
    # Safely extract metadata
    try:
        artist_variant = metadata.get('xesam:artist')
        if artist_variant and artist_variant.get_type_string() == 'as':
            artist = artist_variant.get_strv()[0]
        else:
            artist = ''
    except (AttributeError, IndexError):
        artist = ''
    
    try:
        title = metadata.get('xesam:title').get_string() if metadata.get('xesam:title') else ''
    except AttributeError:
        title = ''
    
    try:
        album = metadata.get('xesam:album').get_string() if metadata.get('xesam:album') else ''
    except AttributeError:
        album = ''
    
    # Set icon based on player and status
    if player_name == 'spotify' and status == 'Playing':
        icon = '󰓃'
    elif player_name == 'firefox' and status == 'Playing':
        icon = '󰈹'
    elif player_name == 'chromium' and status == 'Playing':
        icon = '󰈻'
    elif player_name == 'vlc' and status == 'Playing':
        icon = '󰕼'
    elif status == 'Playing':
        icon = '󰓃'
    elif status == 'Paused':
        icon = '󰓃'
    else:
        icon = '󰓃'
    
    # Format the output text
    if artist and title:
        if len(title) > 30:
            title = title[:27] + "..."
        if len(artist) > 20:
            artist = artist[:17] + "..."
        text = f"{icon} {artist} - {title}"
    elif title:
        if len(title) > 35:
            title = title[:32] + "..."
        text = f"{icon} {title}"
    else:
        text = f"{icon} {player_name.capitalize()}"
    
    write_output(text, player)

def on_player_appeared(manager, player):
    player.connect('playback-status', on_play, manager)
    player.connect('metadata', on_metadata, manager)
    on_metadata(player, player.props.metadata, manager)

def on_player_vanished(manager, player):
    write_output("", player)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--player')
    args = parser.parse_args()

    manager = Playerctl.PlayerManager()
    manager.connect('name-appeared', on_player_appeared)
    manager.connect('name-vanished', on_player_vanished)

    for name in manager.props.player_names:
        if args.player is not None and args.player != name.name:
            continue
        player = Playerctl.Player.new_from_name(name)
        on_player_appeared(manager, player)

    try:
        main_loop = GLib.MainLoop()
        main_loop.run()
    except KeyboardInterrupt:
        pass

if __name__ == '__main__':
    main() 
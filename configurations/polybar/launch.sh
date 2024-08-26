#!/usr/bin/env bash

# Add this script to your wm startup file.

# Terminate already running bar instances
pkill -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# Little script to have polybar open on every monitor
if type "xrandr"; then
    MONITOR=$m polybar -q main --config=/$HOME/nixos-config/configurations/polybar/config.ini &
else
    polybar -q main --config=/$HOME/nixos-config/configurations/polybar/config.ini
fi


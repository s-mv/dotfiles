#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
MONITOR=$(xrandr --query | grep " connected" | cut -d" " -f1 | head -n 1)
MONITOR=$MONITOR polybar --reload main &


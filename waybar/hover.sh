#!/usr/bin/env bash

BAR="waybar"
INTERVAL=0.1
STATE=1
DEADZONE=20

while true; do
    BAR_PID=$(pgrep -x waybar | head -n1)
    [[ -n "$BAR_PID" ]] && break
    sleep 0.2
done

while true; do
    Y=$(hyprctl cursorpos | awk '{print $2}')
    MONITOR=$(hyprctl monitors -j | jq -r --argjson Y "$Y" '.[] | select(.y <= $Y and ($Y < (.y + .height))) | .name')
    HEIGHT=$(hyprctl monitors -j | jq -r --arg MON "$MONITOR" '.[] | select(.name==$MON) | .height')
    [[ -z "$HEIGHT" ]] && sleep $INTERVAL && continue

    if (( Y >= HEIGHT-DEADZONE && STATE==0 )); then
        pkill -x -SIGUSR1 waybar
        STATE=1
    elif (( Y < HEIGHT-DEADZONE && STATE==1 )); then
        pkill -x -SIGUSR1 waybar
        STATE=0
    fi

    sleep $INTERVAL
done


#!/usr/bin/env bash

modifiers=$(xinput --query-state "Your Touchpad" | grep -o "keycode.*")

if [[ "$modifiers" == *Control* && "$modifiers" == *Shift* ]]; then
    hyprctl dispatch movetoworkspace next
elif [[ "$modifiers" == *Control* ]]; then
    hyprctl dispatch movewindow next
elif [[ "$modifiers" == *Shift* ]]; then
    hyprctl dispatch workspace next
else
    hyprctl dispatch workspace next
fi


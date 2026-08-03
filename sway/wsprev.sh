#!/usr/bin/env bash

current=$(swaymsg -t get_workspaces | jq '.[] | select(.focused).num')
max=$(swaymsg -t get_workspaces | jq '.[].num' | sort -n | tail -1)

if [ "$current" -eq 0 ]; then
    target=$((max))
else
    target=$((current - 1))
fi

swaymsg "move container to workspace $target; workspace $target"


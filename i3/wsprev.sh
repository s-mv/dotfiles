#!/bin/sh
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
max=$(i3-msg -t get_workspaces | jq '.[].num' | sort -n | tail -1)

if [ "$current" -eq 1 ]; then
    target=$((max + 1))
else
    target=$((current - 1))
fi

i3-msg "move container to workspace number $target; workspace number $target"


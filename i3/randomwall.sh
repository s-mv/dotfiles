#!/bin/bash

DIR="$HOME/.config/i3/wallpapers"
WALL=$(ls "$DIR"/wallpaper*.jpeg | shuf -n 1)
feh --bg-scale "$WALL"


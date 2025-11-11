#!/bin/bash

DIR="$HOME/.config/wallpapers"
WALL=$(ls "$DIR"/wallpaper*.jpeg | shuf -n 1)
swaybg -i "$WALL" -m fill &


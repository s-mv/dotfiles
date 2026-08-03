#!/usr/bin/env bash

geom=$(xdotool getactivewindow getwindowgeometry --shell | awk -F= '
/WIDTH/{w=$2}
/HEIGHT/{h=$2}
/X/{x=$2}
/Y/{y=$2}
END{print w "x" h "+" x "+" y}')
maim -g "$geom" | xclip -selection clipboard -t image/png


WIN_ID=$(xdotool getactivewindow)
PID=$(xprop -id $WIN_ID _NET_WM_PID | awk '{print $3}')
SHELL_PID=$(pgrep -P $PID | head -n1)
CWD=$(readlink -f /proc/$SHELL_PID/cwd)
alacritty --working-directory "$CWD"


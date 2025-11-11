#!/usr/bin/env bash

options="Shutdown\nReboot\nSuspend\nLock\nLogout"
chosen=$(echo -e "$options" | wofi --dmenu -i -p "Power Menu")

case "$chosen" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Suspend) systemctl suspend ;;
  Lock) swaylock ;;
  Logout) swaymsg exit ;;
esac


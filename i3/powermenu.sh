#!/usr/bin/env bash

options="Shutdown\nReboot\nSuspend\nLock\nLogout"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
  *Shutdown) systemctl poweroff ;;
  *Reboot) systemctl reboot ;;
  *Suspend) systemctl suspend ;;
  *Lock) i3lock ;;
  *Logout) i3-msg exit ;;
  *) exit 1 ;;
esac


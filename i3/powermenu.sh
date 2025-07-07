#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nSuspend\nLock\nLogout" | dmenu -i -p "Power")

case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Suspend) systemctl suspend ;;
  Lock) i3lock ;;
  Logout) i3-msg exit ;;
esac


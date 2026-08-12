#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nLogout\nLock" | fuzzel --dmenu)

case $choice in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Logout) hyprctl eval 'hl.dispatch(hl.dsp.exit())' ;;
    Lock) hyprlock ;;
esac

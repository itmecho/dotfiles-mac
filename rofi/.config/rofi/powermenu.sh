#!/bin/sh

choice=$(echo -e "襤\nﰇ" | rofi -dmenu -theme powermenu -i -columns 2 -no-custom)

if [[ "${choice}" == "襤" ]]; then
    systemctl poweroff
elif [[ "${choice}" == "ﰇ" ]]; then
    systemctl reboot
fi

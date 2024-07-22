#!/bin/sh

while true; do

    bat=$(cat /sys/class/power_supply/BAT1/capacity)

    if [ $bat -le 15 ]; then
        notify-send --urgency=critical "Battery Low" "Level: ${bat}"
        sleep 2000
    else
        sleep 30
    fi
done

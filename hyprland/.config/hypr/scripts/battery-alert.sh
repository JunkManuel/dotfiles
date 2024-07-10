#!/bin/sh

while true; do

    bat=$(cat /sys/class/power_supply/BAT1/capacity)

    if [ $bat -le 10 ]; then
        notify-send --urgency=critical "Battery Low" "Level: ${bat}"
        sleep 2000
    else
        sleep 120
    fi

done

#!/bin/sh

msgTag="myvolume"

wpctl set-volume @DEFAULT_SINK@ "$1%$2"

volume="$(wpctl get-volume @DEFAULT_SINK@ | cut -d " " -f 2 | tr -d ".")"
# volumei="$(wpctl get-volume @DEFAULT_SINK@ | cut -d " " -f 2 | cut -d "." -f 1)"

# if [ "$volumei" -eq 0 ]; then
# 		dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%"
# else
# 		dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"100" "Volume: 100%"
# fi

dunstify -a "changeVolume"\
    -u low\
    -i audio-volume-high\
    -h int:value:"$volume"\
    -h string:x-dunst-stack-tag:$msgTag\
    "Volume: ${volume}%"

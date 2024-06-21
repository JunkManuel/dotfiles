#!/bin/sh


msgTag="mybrightness"

# brightnessctl s "$@"%
xbacklight "$@"

brightness="$(xbacklight -get)"
# volumei="$(wpctl get-volume @DEFAULT_SINK@ | cut -d " " -f 2 | cut -d "." -f 1)"

# if [ "$volumei" -eq 0 ]; then
# 		dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%"
# else
# 		dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"100" "Volume: 100%"
# fi

dunstify -a "setbrightness" -u low -i display-brightness-symbolic -h string:x-dunst-stack-tag:$msgTag -h int:value:"$brightness" "Brightness: ${brightness}%"

#!/bin/sh

msgTag="myvolume"

wpctl set-volume @DEFAULT_SINK@ "$@"

volume="$(wpctl get-volume @DEFAULT_SINK@ | cut -d " " -f 2 | tr -d ".")"

dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%"

#!/bin/sh
refresh() {
	# Refreshes waybar
	# ~/.local/bin/bar

	# restart dunst
	# systemctl --user restart dunst
    pkill -9 dunst
    dunst &

	# Update wallpaper on rofi configs
	# rm ~/.config/rofi/.current_wallpaper && \
	# 		ln -rs $(/usr/bin/cat ~/.cache/wal/wal) ~/.config/rofi/.current_wallpaper
}

hypaper() {
    hyprctl hyprpaper preload "$1"
    hyprctl hyprpaper wallpaper "eDP-1,$1"
}

main() {
    if test -n "$1"; then
        __WALLPAPER="$1"
    fi
    if test -n "$WALLPAPER"; then
        __WALLPAPER="$WALLPAPER" 
    fi
    if test -z "$__WALLPAPER"; then
        exit 1 
    fi

    hypaper "${__WALLPAPER}"
    wallust run -s "${__WALLPAPER}"

    unset __WALLPAPER
	sleep 0.5
	refresh
}

main $@

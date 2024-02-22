#!/bin/sh
ps -p $(pgrep waybar) >& /dev/null

if [ $? -eq 0 ]; then
		# echo "hay proceso"	
		sh -c "~/.local/bin/reload-bar"
else
		# echo "nn hay proceso"
		sh -c "/usr/bin/waybar -c ~/.config/waybar/config.jsonc >& $(mktemp --suffix=.waybar.log)" &
fi

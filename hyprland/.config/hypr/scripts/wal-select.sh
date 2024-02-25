#!/bin/bash
scriptsDir="$HOME/.config/hypr/scripts"

# WALLPAPERS PATH
wallDIR="$HOME/wallpapers"

# Transition config
FPS=60
TYPE="random"
DURATION=2
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"
WAL_FLAGS="--saturate 0.85 --backend colorz --cols16 -nteq"

# Check if swaybg is running
if pidof swaybg > /dev/null; then
  pkill swaybg
fi

# Retrieve image files
PICS=($(ls "${wallDIR}" | grep -E ".jpg$|.jpeg$|.png$|.gif$"))
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME="${#PICS[@]}. random"

# Rofi command
rofi_command="rofi -show -dmenu -theme $HOME/.config/rofi/themes/wallpaper-select.rasi"


refresh() {
		# Refreshes waybar
		~/.local/bin/bar

		# restart dunst
		systemctl --user restart dunst

		# Update wallpaper on rofi configs
		rm ~/.config/rofi/.current_wallpaper && \
				ln -rs $(/usr/bin/cat ~/.cache/wal/wal) ~/.config/rofi/.current_wallpaper
}

menu() {
  for i in "${!PICS[@]}"; do
    # Displaying .gif to indicate animated images
    if [[ -z $(echo "${PICS[$i]}" | grep .gif$) ]]; then
      printf "$(echo "${PICS[$i]}" | cut -d. -f1)\x00icon\x1f${wallDIR}/${PICS[$i]}\n"
    else
      printf "${PICS[$i]}\n"
    fi
  done

  printf "$RANDOM_PIC_NAME\n"
}

swww query || swww init

main() {
  choice=$(menu | ${rofi_command})

  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Random choice case
  if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
    swww img "${wallDIR}/${RANDOM_PIC}" $SWWW_PARAMS
    wal $WAL_FLAGS -i "${wallDIR}/${RANDOM_PIC}"
	sleep 0.5
	refresh
    exit 0
  fi

  # Find the index of the selected file
  pic_index=-1
  for i in "${!PICS[@]}"; do
    filename=$(basename "${PICS[$i]}")
    if [[ "$filename" == "$choice"* ]]; then
      pic_index=$i
      break
    fi
  done

  if [[ $pic_index -ne -1 ]]; then
    swww img "${wallDIR}/${PICS[$pic_index]}" $SWWW_PARAMS
    wal $WAL_FLAGS -i "${wallDIR}/${PICS[$pic_index]}"
	sleep 0.5
	refresh
  else
    echo "Image not found."
    exit 1
  fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main 
# ${scriptsDir}/pywalSwww.sh
# sleep 0.2
# ${scriptsDir}/refresh.sh

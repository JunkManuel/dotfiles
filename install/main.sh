#!/usr/bin/env sh

if [ "$(whoami)" = "root" ]
then
	printf "No Root Execution of this Script, \
		\nexecute as intended user\n"
	exit 1
fi

printf "Stow da shit out of the dirs or not? [y/N]" & read bool_stow
bool_stow=$(echo -e "${bool_stow}" | tr -d '[:space:]') #Striped of spaces
conf_dirs=( kitty neovim pywal scripts waybar WebCord wlogout wofi xdg-user-dirs zsh pipewire )

# install yay in case it is not installed
if ! command -v yay >& /dev/null
then
	tmp = $(mktemp -d)
	git clone https://aur.archlinux.org/yay.git $tmp
	cd $tmp && makepkg -si
fi

if [ $bool_stow = "y" ] || [ $bool_stow = "Y" ]
then
for dir in conf_dirs;
do
	# cd into the proyect directory
	cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

	# Usamo stow para symlinkear
	stow -t $HOME ../dir
done
fi

# cd into the proyect directory
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

yay -Syy
yay -S --needed < ../.pkglist 

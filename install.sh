#!/usr/bin/env sh
#
# Usamo stow para symlinkear

conf_dirs=( kitty neovim pywal scripts waybar WebCord wlogout wofi xdg-user-dirs zsh )

for dir in conf_dirs;
do
	stow -t $HOME dir
done

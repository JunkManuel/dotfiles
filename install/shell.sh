#!/usr/bin/env sh
#
if [ "$(whoami)" = "root" ]
then
	printf "No Root Execution of this Script, \
		\nexecute as intended user\n"
	exit 1
fi

# install yay in case it is not installed
if ! command -v yay >& /dev/null
then
	tmp=$(mktemp -d)
	git clone https://aur.archlinux.org/yay.git $tmp
	cd $tmp && makepkg -si
fi

# cd into the proyect directory
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd ..

config_dirs=( zsh neovim profile scripts pywal)

for dir in ${config_dirs[@]};
do
	stow -t $HOME $dir
done

yay -Sy
yay -S --needed --noconfirm $({cat install/shell.pkglist})

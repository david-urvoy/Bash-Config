#!/bin/bash

distro=$(uname -a)
if [[ $distro == *"Ubuntu"* ]] || [[ $distro == *"Debian"* ]]; then
    sudo apt-get install zsh -y
elif [[ $distro == *"Fedora"* ]]; then
    sudo dnf install zsh -y
fi

. $CONFIG_ZSH/powerline-fonts/install.sh

cp -r $CONFIG_ZSH/.zshrc ~/
cp -r $CONFIG_ZSH/.zsh ~/
. ~/.zshrc

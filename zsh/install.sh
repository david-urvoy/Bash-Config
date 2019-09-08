#!/bin/bash

sudo $PKG_MANAGER install zsh -y

. $CONFIG_ZSH/powerline-fonts/install.sh

cp -r $CONFIG_ZSH/.zshrc ~/
cp -r $CONFIG_ZSH/.zsh ~/
. ~/.zshrc

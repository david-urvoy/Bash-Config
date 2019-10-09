#!/bin/bash


if [ $ENV_TYPE != "CONTAINER" ]; then sudo $PKG_MANAGER install zsh -y; fi

if [ $ENV_TYPE != "CONTAINER" ]; then sudo $PKG_MANAGER install fonts-powerline -y; fi

cp -r $CONFIG_ZSH/.zshrc ~/
cp -r $CONFIG_ZSH/.zsh ~/
. ~/.zshrc

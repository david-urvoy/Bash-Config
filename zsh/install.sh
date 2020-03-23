#!/bin/bash

if [ $ENV_TYPE != "CONTAINER" ]; then 
    sudo $PKG_MANAGER install zsh -y;
    sudo $PKG_MANAGER install fonts-powerline -y;
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

cp -r $CONFIG_ZSH/.zshrc ~/
cp -r $CONFIG_ZSH/.zsh ~/
. ~/.zshrc

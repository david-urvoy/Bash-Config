#!/bin/bash

if [ $ENV_TYPE != "CONTAINER" ]; then 
    sudo $PKG_MANAGER install zsh -y;
    sudo $PKG_MANAGER install fonts-powerline -y;
    echo "installing zsh"
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
echo "copying zsh config files"
cp -r $CONFIG_ZSH/.zshrc ~/
cp -r $CONFIG_ZSH/.zsh ~/
. ~/.zshrc

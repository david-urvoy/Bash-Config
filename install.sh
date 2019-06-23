#!/bin/zsh

git submodule update --init --recursive

cp -r ./.zshrc ~/
cp -r ./.zsh ~/

. ~/.zshrc

# install nvim
./nvim/install.sh

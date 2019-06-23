#!/bin/zsh

git submodule update --init --recursive

cp -r ./.zshrc ~/
cp -r ./.zsh ~/
cp -r ./.vim ~/
mkdir -p ~/.config/nvim/ && cp -r ./init.vim ~/.config/nvim

. ~/.zshrc

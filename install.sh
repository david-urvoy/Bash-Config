#/bin/zsh

# init global variables
. ./.path

git submodule update --init --recursive

# install zsh
./zsh/install.sh

# install nvim
./nvim/install.sh

# install git
./git/install.sh

zsh

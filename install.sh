#/bin/zsh

# init path variables
. ./.path

# init distribution variables
. ./.distrib

git submodule update --init --recursive

# install zsh
./zsh/install.sh

# install nvim
./nvim/install.sh

# install git
./git/install.sh

zsh

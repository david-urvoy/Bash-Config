#/bin/zsh

# init path variables
. ./.path

# init distribution variables
. ./.distrib

git submodule update --init --recursive

sudo $PKG_MANAGER update

# install zsh
./zsh/install.sh

# install tmux
sudo $PKG_MANAGER install -y tmux

# install nvim
./nvim/install.sh

# install git
./git/install.sh

zsh

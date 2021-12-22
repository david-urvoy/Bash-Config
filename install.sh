#!/bin/bash

#if [[ -z $1 ]]; then
	dev_home=$HOME/development
#else
#	dev_home=$1
#fi

# init path variables
. $dev_home/config/.path $dev_home

# init distribution variables
. $CONFIG_HOME/.distrib

if [ $ENV_TYPE != "CONTAINER" ]; then sudo $PKG_MANAGER update; fi

# install zsh
. $CONFIG_ZSH/install.sh

# install tmux
if [ $ENV_TYPE != "CONTAINER" ]; then sudo $PKG_MANAGER install -y tmux; fi

# install nvim
. $CONFIG_NVIM/install.sh

# install git
. $CONFIG_GIT/install.sh

zsh

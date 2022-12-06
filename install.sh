#!/bin/bash

dev_home=$HOME/development

# init path variables
. $dev_home/config/.path $dev_home

# install zsh
. $CONFIG_ZSH/install.sh

# install git
. $CONFIG_GIT/install.sh


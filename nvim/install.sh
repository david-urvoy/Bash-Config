NVIM_DIR=~/.config/nvim

if [ $ENV_TYPE != "CONTAINER" ]; then sudo $PKG_MANAGER install neovim -y; fi

# .vimrc
cp $CONFIG_NVIM/.vimrc ~/
# copy nvim config
mkdir -p $NVIM_DIR && cp -r $CONFIG_NVIM/init.vim $NVIM_DIR

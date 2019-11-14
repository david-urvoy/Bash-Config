NVIM_DIR=~/.config/nvim

if [ $ENV_TYPE != "CONTAINER" ]; then sudo $PKG_MANAGER install neovim -y; fi

# copy nvim config
mkdir -p $NVIM_DIR && cp -r $CONFIG_NVIM/init.vim $NVIM_DIR
# copy coc config
cp $CONFIG_NVIM/coc-settings.json $NVIM_DIR

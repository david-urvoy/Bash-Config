NVIM_DIR=~/.config/nvim

if [ $ENV_TYPE != "CONTAINER" ]; then
    echo ">> Installing Neovim from appimage"
    sudo $PKG_MANAGER autoremove -y neovim;
    sudo $PKG_MANAGER install -y nodejs npm;
#    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage;
#    sudo chmod u+x nvim.appimage;
    sudo ln -sf $CONFIG_NVIM/nvim.appimage /usr/bin/nvim;
    sudo $PKG_MANAGER install -y python3-neovim;
    echo ">> Neovim installed in /usr/bin/nvim"
fi

# copy nvim config
mkdir -p $NVIM_DIR && cp -r $CONFIG_NVIM/init.vim $NVIM_DIR
# copy coc config
cp $CONFIG_NVIM/coc-settings.json $NVIM_DIR
# install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

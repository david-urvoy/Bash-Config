NVIM_DIR=~/.config/nvim
AUTOLOAD_DIR=~/.local/share/nvim/site
NVIM_HOME=$CONFIG_HOME/nvim

# copy vim config
cp -r $NVIM_HOME/.vim ~/
# copy nvim config
mkdir -p $NVIM_DIR && cp -r $NVIM_HOME/init.vim $NVIM_DIR
# copy vim-plug config
mkdir -p $AUTOLOAD_DIR && cp -r $NVIM_HOME/autoload $AUTOLOAD_DIR

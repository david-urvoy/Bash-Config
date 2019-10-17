" Copy to ~/.config/nvim/

" ---------- .vimrc ----------
set runtimepath^=~/.vim/bundle/nerdtree/plugin/NERD_tree.vim

"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"-- INDENTATION --
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" NERD_TREE
let mapleader = "-"
nmap <leader>p :NERDTreeFind<cr>

" map <silent> <C-p> :NERDTreeFind
" map <silent> <S-p> :NERDTreeToggle<CR>


" ---------- Plugins (vim-plug) ----------
call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Javascript
Plug 'pangloss/vim-javascript'

" Typescript
Plug 'leafgarland/typescript-vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Javascript libs
Plug 'othree/javascript-libraries-syntax.vim'

" Jasmine
Plug 'claco/jasmine.vim'

" Syntax checking
Plug 'scrooloose/syntastic'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()

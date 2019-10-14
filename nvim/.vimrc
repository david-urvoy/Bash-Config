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

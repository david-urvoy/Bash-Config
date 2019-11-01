" Copy to ~/.config/nvim/

" ---------- .vimrc ----------
set runtimepath^=~/.vim/bundle/nerdtree/plugin/NERD_tree.vim

let mapleader = " "
set number relativenumber

set matchpairs+=<:>
set autoindent
set mouse=a

"-- AUTOCOMPLETION --
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

"-- INDENTATION --
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" NERD_TREE
nmap <leader>P :NERDTreeToggle<cr>
nmap <leader>p :NERDTreeFind<cr>
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1

nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h


" ---------- Plugins (vim-plug) ----------
call plug#begin()

" linter
Plug 'w0rp/ale'

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

" Utilities
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
" Default vim configuration ?
Plug 'tpope/vim-sensible'
" Plug 'ervandew/supertab'
Plug 'wesQ3/vim-windowswap' " <leader>ww copy window | <leader>ww paste window to switch
Plug 'SirVer/ultisnips' " TODO config (major code completion & refactoring)
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim' " TODO install fzf ?

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Coc Extensions
let g:coc_global_extensions = ['coc-tsserver']

" Theme
let g:airline_theme='dracula'

" ---------- ale ----------
let g:ale_sign_highlight_linenrs = 1
let g:ale_linters = {}
let g:ale_sign_error = ""
let g:ale_sign_warning = ""
let g:airline#extensions#ale#enabled = 1
let g:formatdef_eslint = '"eslint-formatter"'
let g:formatters_javascript = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['eslint'], 'json': ['jq'], 'html': ['prettier'] }
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'always'
let g:ale_sign_column_always = 1
let g:ale_echo_cursor = 1

" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

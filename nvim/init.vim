" Copy to ~/.config/nvim/

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

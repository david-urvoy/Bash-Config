" Copy to ~/.config/nvim/

call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Javascript
Plug 'pangloss/vim-javascript'

" Typescript
Plug 'leafgarland/typescript-vim'

" Javascript libs
Plug 'othree/javascript-libraries-syntax.vim'

" Angular
Plug 'matthewsimo/angular-vim-snippets'

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

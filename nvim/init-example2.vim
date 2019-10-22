" Vim-PLug Core {{{
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
 
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
 
  autocmd VimEnter * PlugInstall
endif
 
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))
" }}}
" Plug install packages {{{
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'heavenshell/vim-jsdoc'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'wellle/targets.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'dracula/vim',{'name':'dracula'}
 
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}
 
"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
" Custom bundles {{{
"*****************************************************************************
 
" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
"Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
 
 
" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
 
"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
 source ~/.config/nvim/local_bundles.vim
endif
 
call plug#end()
 
" Required:
filetype plugin indent on
 
" }}}
" Basic Setup {{{
"*****************************************************************************"
"" Sync and syntax refresh stuff
syntax sync fromstart
set redrawtime=10000
 
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
 
"" Disable soft wrapping
set wrap!
 
"" automatically mkview and loadview on exit/open
"" TODO: fix when using things like CTRL+P
"" au BufWinLeave * mkview
"" au BufWinEnter * silent loadview
 
"" Marker fold method
set foldmethod=marker
 
"" Enable line numbers
set number
 
"" Highlight the line on which the cursor lives
set nocursorline
 
"" Map leader to ,
let mapleader=' '
 
" Always show at least one line above/below the cursor.
set scrolloff=2
" Always show at least one line left/right of the cursor.
set sidescrolloff=5
 
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
 
" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
 
" Use system clipboard
set clipboard=unnamedplus
 
" Remove timeout for partially typed commands
set notimeout
 
" F keys
" Quick write session with F2
map <F2> :mksession! ~/.vim_session<cr>
" And load session with F3
map <F3> :source ~/.vim_session<cr>
 
" Fix indentation
map <F7> gg=G<C-o><C-o>
" Toggle auto change directory
map <F8> :set autochdir! autochdir?<CR>
 
" Indentation
set smarttab
set expandtab
set tabstop=2
set softtabstop=4
set shiftwidth=2
 
"set smartindent
set autoindent
"set cindent
 
set nocompatible
filetype plugin indent on
 
" Relative line numbers
set number relativenumber
 
" Toggle vertical line
set colorcolumn=
set cc=
fun! ToggleCC()
 if &cc == ''
   " set cc=1,4,21
   set cc=80
 else
   set cc=
 endif
endfun
nnoremap <silent> <F9> :call ToggleCC()<CR>
 
" Allow switching between buffers without saving
set hidden
 
" Mouse support
set mouse=a
 
"Case insensitive searching
set ignorecase
 
"Will automatically switch to case sensitive if you use any capitals
set smartcase
 
" Auto toggle smart case of for ex commands
" Assumes 'set ignorecase smartcase'
augroup dynamic_smartcase
 autocmd!
 autocmd CmdLineEnter : set nosmartcase
 autocmd CmdLineLeave : set smartcase
augroup END
 
" Substitute live preview
set inccommand=nosplit
 
" Highlighted yank (-1 for persistent)
let g:highlightedyank_highlight_duration = 400
 
" If lightline/airline is enabled, don't show mode under it
set noshowmode
 
set fileformats=unix,dos,mac
 
if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif
 
set background=dark
syntax enable
 
" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>
 
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
 
set wildmenu
 
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e
 
" Restore last cursor position and marks on open
au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
 
" }}}
" NERD Tree {{{
"*****************************************************************************
 
"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
let NERDTreeMinimalUI=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>doc :JsDoc<CR>
 
"" NERDTree + Startify
 "autocmd VimEnter *
  "\   if !argc()
  "\ |   Startify
  "\ |   NERDTree
  "\ |   wincmd w
 " \ | endif
 
" grep.vim
nnoremap <silent> <leader>s :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'
 
" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>
 
" }}}
" Mappings {{{
"*****************************************************************************
"" allows navigating soft wraps with j and k but 10j still uses lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
 
"" Quick exit insert mode with jk
inoremap jk <ESC>
 
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
set splitbelow
set splitright
 
"" Tabs
nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t>     :e<CR>
 
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
 
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
 
"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
 
"" Tag bar
nmap <Leader># :TagbarToggle<CR>
 
" }}}
" Plugin-specific Settings {{{
"*****************************************************************************
"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
 
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
 
  let height = float2nr(10)
  let width = float2nr(80)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
 
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
 
  call nvim_open_win(buf, v:true, opts)
endfunction
 
" Startify
let g:startify_bookmarks=['~/.bashrc', '~/.config/nvim/init.vim', '~/.config/awesome', '~/Projects']
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Recent Files']   },
          \ { 'type': 'dir',       'header': ['   Recent Files in: '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
 
let g:startify_custom_header = systemlist('motivate --no-colors')
 
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <leader>f :Lines<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>
 
" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
 
" ale
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
nmap <F5> <Plug>(ale_fix)
 
" vim workspace
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
 
" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
 
" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
 
"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
 
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
 
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
 
"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
 
"" Close buffer
noremap <leader>c :bd<CR>
 
"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
 
"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
 
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
 
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
 
" }}}
" Coc-specific Settings {{{
"*****************************************************************************
 
let g:airline#extensions#coc#enabled = 1
 
" if hidden is not set, TextEdit might fail.
set hidden
 
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
 
" Better display for messages
set cmdheight=1
 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
 
" don't give |ins-completion-menu| messages.
set shortmess+=c
 
" always show signcolumns
set signcolumn=yes
 
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
 
" Remap for format selected region
xmap <leader>format  <Plug>(coc-format-selected)
nmap <leader>format  <Plug>(coc-format-selected)
 
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
 
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
 
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
 
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
 
" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
 
" }}}
" Theme {{{
"*****************************************************************************
" Colorscheme
"if empty($DISPLAY)
  "colorscheme lena
  "else
  "colorscheme onehalfdark
"endif
colorscheme ephemanord
"colorscheme dracula
set fillchars=vert::
 
source $HOME/.config/nvim/statusline.vim
 
" }}}
" AutoCMDs {{{
"*****************************************************************************
command! -complete=customlist,s:project_complete -nargs=1 Project cd <args>
 
function! s:project_complete(lead, cmdline, _) abort
  let results = keys(get(g:, 'PROJECTS', {}))
 
  " use projectionist if available
  if exists('*projectionist#completion_filter')
    return projectionist#completion_filter(results, a:lead, '/')
  endif
 
  " fallback to cheap fuzzy matching
  let regex = substitute(a:lead, '.', '[&].*', 'g')
  return filter(results, 'v:val =~ regex')
endfunction
 
" }}}

sy on
set nu
set t_Co=256

"Search
set ignorecase
set incsearch
set nowrapscan

"Wildmenu
set wildmode=list:longest,full
set wildmenu
set wildignorecase

"Make O not lag that much
set timeout timeoutlen=5000 ttimeoutlen=100

set ruler

"Indentation
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

"Use spaces
set expandtab
set shiftwidth=4
set list

"Always show status bar (Even when one file is openned)
set laststatus=2

set listchars=tab:▸\ ,eol:¬,trail:.
set history=1000

syntax sync minlines=256
set synmaxcol=2048

set clipboard=unnamed

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"no backup or swap files
set nobackup
set nowritebackup
set noswapfile

set virtualedit=block

set backspace=2

set hlsearch

set complete=.,w,b,u,i
set pastetoggle=<F9>
set splitright
set path=.,**
set tags+=tags,~/dev/repos/tags
set colorcolumn=120

set shell=zsh\ -l

nnoremap s :w<CR>

"Neobundle

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'snipMate'
"NeoBundle 'tpope/vim-vividchalk'
"NeoBundleLazy 'embear/vim-localvimrc'

"Plugins
NeoBundleLazy 'junegunn/fzf'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'surround.vim'
NeoBundle 'mru.vim'
NeoBundle 'Tabmerge'
NeoBundleLazy 'sjl/gundo.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundle 'vim-scripts/CmdlineComplete'
NeoBundleLazy 'Tagbar'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'fugitive.vim'

"Colors
NeoBundle 'dmitry12/heroku-colorscheme'

"Language specific plugins/Colors for extensions
NeoBundle 'mxw/vim-jsx'
NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

if $DISPLAY == ""
    "When running without X
else
    colorscheme heroku-terminal
"   colorscheme desert
endif

let &scrolloff=999-&scrolloff

"Ctrl+hjkl tmux support
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
let g:jsx_ext_required = 0

autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"remove trailing white spaces
autocmd BufWritePre * :%s/\s\+$//e

let mapleader=" "
nnoremap <leader><leader> :call fzf#run({ 'source': 'find . -type d \( -path ./node_modules -o -path ./.git -o -path ./library/vendor -o -path ./vendor -o -path ./private/node_modules -o -path ./public/js/bower_components -o -path ./bower_components -o -path ./public \) -prune -o -print', 'sink': 'e' })<CR>

nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>pr :TagbarToggle<CR>
nnoremap <leader>c :let @/ = ''<CR>

nnoremap S :!~/bin/sync.sh<CR><CR>

nnoremap gp `[v`]

set foldmethod=indent
nnoremap <leader>b :ls<CR>:b<space>
"let g:user_emmet_expandabbr_key = '<Tab>'

set foldlevelstart=2

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_messages = {}

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "-n  --tab_width=4"

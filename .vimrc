sy on
nnoremap s :w<CR>

"Neobundle

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'surround.vim'
"NeoBundle 'fugitive.vim'
"NeoBundle 'Tabmerge'
"NeoBundle 'tpope/vim-abolish'
"NeoBundle 'snipMate'
"NeoBundleLazy 'scrooloose/syntastic'
"NeoBundle 'tpope/vim-vividchalk'
"NeoBundleLazy 'embear/vim-localvimrc'
"NeoBundle 'stephpy/vim-php-cs-fixer'
"NeoBundleLazy 'junegunn/fzf'
"NeoBundleLazy 'mru.vim'
"NeoBundleLazy 'Tagbar'
"NeoBundle 'groenewege/vim-less'
"NeoBundle 'adoy/vim-php-refactoring-toolbox'
"NeoBundleLazy 'sjl/gundo.vim'
"NeoBundleLazy 'Shougo/neocomplete.vim'
"NeoBundleLazy 'tmhedberg/matchit'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'paradigm/SkyBison'
"NeoBundle 'chilicuil/vim-sprunge'
"NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'dmitry12/heroku-colorscheme'
"NeoBundle 'mustache/vim-mustache-handlebars'
"NeoBundle 'vim-scripts/CmdlineComplete'

NeoBundle 'christoomey/vim-tmux-navigator'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

"Ctrl+hjkl tmux support
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

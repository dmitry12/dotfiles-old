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
set tags+=tags,~/dev/repos/tags
set colorcolumn=120

set shell=zsh\ -l

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'surround.vim'
NeoBundle 'fugitive.vim'
NeoBundle 'Tabmerge'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'snipMate'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundle 'tpope/vim-vividchalk'
NeoBundleLazy 'embear/vim-localvimrc'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundleLazy 'junegunn/fzf'
NeoBundleLazy 'mru.vim'
NeoBundleLazy 'Tagbar'
NeoBundle 'groenewege/vim-less'
NeoBundle 'adoy/vim-php-refactoring-toolbox'
NeoBundle 'embear/vim-localvimrc'
NeoBundleLazy 'sjl/gundo.vim'
NeoBundleLazy 'scrooloose/nerdtree'
NeoBundleLazy 'Shougo/neocomplete.vim'
NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'tmhedberg/matchit'
"NeoBundleLazy 'vim-scripts/php_localvarcheck.vim'
NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'paradigm/SkyBison'
NeoBundle 'chilicuil/vim-sprunge'
NeoBundle 'digitaltoad/vim-jade'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

set background=dark

if $DISPLAY == ""
	"When running without X
else
	colorscheme vividchalk
endif

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set background=light
    set guifont=Monaco:h14
endif

let g:tmux_navigator_no_mappings = 1

"Blinking cursor in insert mode (Tmux support)
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

"Less syntax support
au BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.json set ft=javascript

"Highlight all trailing white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"And remove on save
autocmd BufWritePre * :%s/\s\+$//e

au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
"Hide PHP variables in tagbar
let g:tagbar_type_php  = {
		\ 'ctagstype' : 'php',
		\ 'kinds'     : [
		\ 'i:interfaces',
		\ 'c:classes',
		\ 'd:constant definitions',
		\ 'f:functions',
		\ 'j:javascript functions:1'
		\ ]
	\ }

"Alwaes stay in the middle of the screen
let &scrolloff=999-&scrolloff

command! WQ wq
command! Wq wq
command! W w
command! Q q
cmap w!! w !sudo tee > /dev/null %
command! Soz source ~/.vimrc

nnoremap s :w<CR>
"TODO: Add variable to determine current position, and then get back to it
nnoremap <C-@> :tabe %<CR>:tabp<CR>:q<CR>:tabn<CR>

let mapleader=" "
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>pr :TagbarToggle<CR>
nnoremap <leader>c :let @/ = ''<CR>
nnoremap <leader>sh :set hidden!<CR>:set hidden?<CR>

nnoremap <leader>gs :tabe<CR>:set hidden<CR>:r!git status<CR>
nnoremap <leader>gg :tabe<CR>:set hidden<CR>:r!git grep -i<space>

nnoremap <leader>m :Unite -start-insert file_mru<CR>
nnoremap <leader>ub :Unite -start-insert buffer<CR>
nnoremap <leader>ur :Unite -start-insert register<CR>
nnoremap <leader>ul :Unite -start-insert line<CR>


"nnoremap <leader><leader> :Unite -start-insert -ignorecase file_rec/git file_mru buffer register line<CR>

"TODO Change grep -v to find . -prune -name
nnoremap <leader><leader> :call fzf#run({ 'source': 'find . \| grep -v git \| grep -v node_modules \| grep -v vendor \| grep -v Zend', 'sink': 'e' })<CR>

"Ctrl+hjkl tmux support
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"Paste in visual mode without copying
xnoremap p pgvy

nnoremap X "_x
vnoremap X "_x

nnoremap j gj
nnoremap k gk

nnoremap K i<CR><Esc>

nnoremap <S-h> gT
nnoremap <S-l> gt

nnoremap gp `[v`]
nnoremap <F10> gg<CR><C-w><C-w>gg<CR>:set scrollbind<CR>:diffthis<CR><C-w><C-w>:set scrollbind<CR>:diffthis<CR>

autocmd FileType ruby setl sw=2 sts=2 et
autocmd VimResized * :wincmd =

nmap Y y$

"Also select chromium when tab is reloaded. Clicks at x:2318 y:7
"nnoremap S :wa<CR>:!sync<CR><CR>:!reload-browser<CR><CR>:!xdotool mousemove 2318 7 click 1<CR><CR>
nnoremap S :w<CR>:!sync<CR><CR>
nnoremap <leader>S :w<CR>:!sync<CR><CR>:!reload-browser<CR><CR>:!xdotool mousemove 2318 7 click 1<CR><CR>

if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

set number

highlight clear SignColumn
highlight GitGutterAdd ctermfg=2 ctermbg=0 guifg=#009900 guibg=Grey
highlight GitGutterChangeDefault ctermfg=3 ctermbg=0 guifg=#bbbb00 guibg=Grey
highlight GitGutterDeleteDefault ctermfg=1 ctermbg=0 guifg=#ff2222 guibg=Grey
highlight GitGutterChangeDeleteDefault ctermfg=1 ctermbg=0 guifg=#ff2222 guibg=Grey

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_messages = {}

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "-n  --tab_width=4"

nnoremap <Leader>tu :vs <C-R>=substitute(substitute(expand("%:p"), "\/colourbox", "\/colourbox\/tests/unit", ""), "\.php", "Test.php", "")<CR> <CR>
nnoremap <Leader>ti :vs <C-R>=substitute(substitute(expand("%:p"), "\/colourbox", "\/colourbox\/tests/integration", ""), "\.php", "Test.php", "")<CR> <CR>
nnoremap <Leader>td :vs <C-R>=substitute(substitute(expand("%:p"), "\/colourbox", "\/colourbox\/tests/database", ""), "\.php", "Test.php", "")<CR> <CR>

highlight BookmarkSign ctermbg=NONE ctermfg=136
highlight BookmarkLine ctermbg=17 ctermfg=NONE
let g:bookmark_sign = '∆'
let g:bookmark_highlight_lines = 1

nnoremap Q nop
nnoremap <C-t> :NERDTreeToggle<CR>

" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction

"
" Neocomplete
"
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"
" Neocomplete end
"

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=56 guibg=#5f00d7 cterm=bold gui=bold

let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"

"hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
nnoremap <leader>b :ls<CR>:b<space>

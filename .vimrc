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
NeoBundle 'mru.vim'
NeoBundle 'comments.vim'
NeoBundle 'surround.vim'
NeoBundle 'Tagbar'
NeoBundle 'groenewege/vim-less'
NeoBundle 'fugitive.vim'
NeoBundle 'Tabmerge'
"NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'matrix.vim'
NeoBundle 'd11wtq/tomorrow-theme-vim'
NeoBundle 'tpope/vim-abolish'
"NeoBundle 'joonty/vim-phpqa'
NeoBundle 'junegunn/fzf'
NeoBundle 'SirVer/ultisnips'
"NeoBundle 'honza/vim-snippets'
NeoBundle "rodjek/vim-puppet"
NeoBundle 'snipMate'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'juvenn/mustache.vim'

call neobundle#end()
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Required:
filetype plugin indent on
NeoBundleCheck

set background=dark
"set background=light

colorscheme Tomorrow-Night-Bright

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
nnoremap <C-@> :tabe %<CR>:tabp<CR>:q<CR>:tabn<CR>

let mapleader=" "
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>pr :TagbarToggle<CR>
nnoremap <leader>c :let @/ = ''<CR>
nnoremap <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>m :MRU<CR>

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

""let g:phpqa_messdetector_autorun = 0
""let g:phpqa_codesniffer_autorun = 0
""let g:phpqa_codecoverage_autorun = 1

"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

let g:snips_trigger_key = '<C-k>'

nnoremap <C-p> :FZF<CR>

nnoremap <leader>g :GoldenRatioToggle<CR>
nnoremap <leader>t :tabe<CR>
nnoremap <leader>z $zf%

if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

set relativenumber

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


" http://vim.wikia.com/wiki/VimTip563
" List occurrences of keyword under cursor, and
" jump to selected occurrence.
function! s:JumpOccurrence()
  let v:errmsg = ""
  exe "normal [I"
  if strlen(v:errmsg) == 0
    let nr = input("Which one: ")
    if nr =~ '\d\+'
      exe "normal! " . nr . "[\t"
    endif
  endif
endfunction

" List occurrences of keyword entered at prompt, and
" jump to selected occurrence.
function! s:JumpPrompt()
  let keyword = input("Keyword to find: ")
  if strlen(keyword) > 0
    let v:errmsg = ""
    exe "ilist! " . keyword
    if strlen(v:errmsg) == 0
      let nr = input("Which one: ")
      if nr =~ '\d\+'
        exe "ijump! " . nr . keyword
      endif
    endif
  endif
endfunction

nnoremap <Leader>I :call <SID>JumpOccurrence()<CR>
nnoremap <Leader>p :call <SID>JumpPrompt()<CR>

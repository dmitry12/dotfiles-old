sy on

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

"Indentation
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

"Open split windows from the right side
set splitright

set list

"Always show status bar (Even when one file is openned)
set laststatus=2

set listchars=tab:▸\ ,eol:¬,trail:.
set history=1000

syntax sync minlines=256
set synmaxcol=2048

set clipboard=unnamed,unnamedplus

set mouse=""

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'dmitry12/heroku-colorscheme'

NeoBundle 'bolasblack/csslint.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'vim-scripts/CmdlineComplete'
NeoBundleLazy 'sjl/gundo.vim'
NeoBundleLazy 'mru.vim'
NeoBundleLazy 'Tagbar'
NeoBundleLazy 'scrooloose/nerdtree'
NeoBundle 'fugitive.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'Tabmerge'
NeoBundle 'surround.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'benmills/vimux'

NeoBundle 'honza/vim-snippets'

NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'othree/html5.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'groenewege/vim-less'

NeoBundle 'lambdatoast/elm.vim'
"wait until this is merged https://github.com/neomake/neomake/pull/471
NeoBundle 'ivalkeen/neomake', {'rev': 'place-all-signs'}

"NeoBundle 'paradigm/SkyBison'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

set background=dark

if $DISPLAY == ""
	"When running without X
else
	colorscheme heroku-terminal
endif

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

"Alwaes stay in the middle of the screen
let &scrolloff=999-&scrolloff

command! WQ wq
command! Wq wq
command! W w
command! Q q
cmap w!! w !sudo tee > /dev/null %

nnoremap s :w<CR>
"TODO: Add variable to determine current position, and then get back to it
nnoremap <C-@> :tabe %<CR>:tabp<CR>:q<CR>:tabn<CR>

let mapleader=" "
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>pr :TagbarToggle<CR>
nnoremap <leader>c :let @/ = ''<CR>

"nnoremap <leader><leader> :call fzf#run({ 'source': 'find . \( -name "*.tmp.js" -o -path ./node_modules -o -path ./.git -o -path ./library/vendor -o -path ./coverage -o -path ./vendor -o -path ./public-src/skyfish/react/components/Reuse/node_modules -o -path ./private/node_modules -o -path ./public/js/bower_components -o -path ./bower_components -o -path ./public \) -prune -o -print', 'sink': 'e', 'window': 'rightbelow new', 'down': 20  })<CR>
"
"nnoremap <leader>pp :call fzf#run({ 'source': 'find . \( -name "*.tmp.js" -o -path ./node_modules -o -path ./.git -o -path ./library/vendor -o -path ./coverage -o -path ./vendor -o -path ./public-src/skyfish/react/components/Reuse/node_modules -o -path ./private/node_modules -o -path ./public/js/bower_components -o -path ./bower_components \) -prune -o -print', 'sink': 'e' })<CR>

nnoremap <leader><leader> :call fzf#run({ 'sink': 'e', 'window': 'rightbelow new' })<CR>

"Paste in visual mode without copying
xnoremap p pgvy

nnoremap X "_x
vnoremap X "_x

nnoremap j gj
nnoremap k gk

nnoremap K i<CR><Esc>

nnoremap gp `[v`]

nnoremap S :w<CR>:call VimuxRunCommand('~/bin/sync')<CR><CR>

nnoremap <Leader>tu :vs <C-R>=substitute(substitute(expand("%:p"), "\/colourbox", "\/colourbox\/tests/unit", ""), "\.php", "Test.php", "")<CR> <CR>

nnoremap Q nop

hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=56 guibg=#5f00d7 cterm=bold gui=bold

nnoremap <leader>b :ls<CR>:b<space>

highlight DiffAdd cterm=none ctermfg=Black ctermbg=Green gui=none guifg=fg guibg=Blue
highlight DiffDelete cterm=none ctermfg=Black ctermbg=Red gui=none guifg=fg guibg=Blue
highlight DiffChange cterm=none ctermfg=Black ctermbg=Blue gui=none guifg=fg guibg=Blue
highlight DiffText cterm=none ctermfg=Black ctermbg=Yellow gui=none guifg=bg guibg=White

set diffopt+=iwhite

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let NERDTreeIgnore = ['\.tmp.js$']
nnoremap <leader>a :NERDTree %:h<CR>

nnoremap <leader>cwd :cd %:h<CR>
nnoremap <leader>cd :Rooter<CR>

let g:rooter_manual_only = 1 " To stop vim-rooter changing directory automatically

autocmd FileType javascript setlocal omnifunc=tern#Complete

"When using filesystem autocomplete, first cd to relative folder to file and then autocomplete
inoremap <C-X><C-F> <ESC>:cd %:h<CR>a<C-X><C-F>


augroup active_relative_number
  au!
  au BufEnter * :setlocal number
  au WinEnter * :setlocal number
  au BufLeave * :setlocal nonumber
  au WinLeave * :setlocal nonumber
augroup END

let g:fzf_layout = {}

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:syntastic_javascript_checkers = ['eslint']

"http://vim.wikia.com/wiki/Git_grep
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

function! GetVisuallySelectedText()
  " Stolen from http://stackoverflow.com/a/6271254/794380
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]

  return join(lines, "\n")
endfunction

function! GitGrepVisuallySelectedText()
  let input = GetVisuallySelectedText()

  execute "vnew"
  execute "set hidden"
  execute "r!git grep -i " . input . " *"
endfunction

xnoremap <leader>G :call GitGrepVisuallySelectedText()<CR>

set suffixesadd=.es,.js,.jsx

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

let g:neomake_open_list=0
let g:neomake_place_signs_at_once = 1

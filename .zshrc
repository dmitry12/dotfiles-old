export ZSH=$HOME/.oh-my-zsh
cd $HOME

ZSH_THEME="agnoster"
plugins=(wd)

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zsh/includes.zsh ]; then
	source ~/.zsh/includes.zsh
fi

if [ -f ~/.zsh/startup.zsh ]; then
	source ~/.zsh/startup.zsh
fi

export PATH="/opt/local/libexec/gnubin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/opt/ImageMagick/bin:$HOME/bin:/usr/local/share/python"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

# zsh copy-mode
export EDITOR="vim"
bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

alias wh='which'
alias tmux='TERM=screen-256color-bce tmux'
alias soz='source ~/.zshrc'

# Misc
alias vim='/opt/local/bin/vim'
alias verdure='mplayer http://air.verdure.ru:8881/'
alias cliqhop='mplayer -playlist http://somafm.com/cliqhop.pls'
alias rutr='/Users/dmitree/dev/repos/google-translate-cli/translate {=ru}'
alias tempmonitor='/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor'

# Use gnu grep
alias grep='ggrep'
alias sed='gsed'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

alias -g G='| grep -i '
alias -g S='-sub '
alias -g C='| reattach-to-user-namespace pbcopy'
alias -g L='| less -Si'

function c () {
	echo $1 | tr -d '\n' | reattach-to-user-namespace pbcopy
}

# open this extensions with vim
alias -s php=vim
alias -s html=vim
alias -s phtml=vim
alias -s css=vim
alias -s less=vim
alias -s js=vim
alias -s rb=vim
alias -s txt=vim
alias -s md=vim
alias -s srt=vim
alias -s json=vim

alias -s mp4=mplayer
alias -s avi=mplayer
alias -s mkv=mplayer

alias -s zip=unzip

alias ff="source newf"
alias gg="source newg"
alias lf="source newlf"

alias sff='source ${HOME}/.tmp/findAliases'
alias sgg='source ${HOME}/.tmp/grepAliases'

alias torp='~/dev/repos/torp/bin/torp'

hash -d d=~/Downloads
hash -d cb=~/dev/repos/colourbox
hash -d b=~/bin
hash -d r=~/dev/repos
hash -d g=~/dev/gists
hash -d db=~/Dropbox
hash -d tor=~/dev/repos/torp

alias d1="cd -"
alias d2="cd -2"
alias d3="cd -3"
alias d4="cd -4"
alias d5="cd -5"
alias d6="cd -6"
alias d7="cd -7"
alias d8="cd -8"
alias d9="cd -9"

alias vs="vim --servername colourbox"
alias vst="vim --servername colourbox --remote-tab"
alias vsl="vim --serverlist"

function vsv() {
	vim --servername colourbox --remote-send "<C-\><C-n>:vnew ${1}<CR>"
}

function vss() {
	vim --servername colourbox --remote-send "<C-\><C-n>:split ${1}<CR>"
}

alias gest='git number -c vim --servername colourbox --remote-tab'

function ua() {
	for (( k=0; k < 2000; k++ )); do
    	unalias ${k} 2>/dev/null
	done
}

export LS_OPTIONS='--color=auto'

alias ls='ls -hF'

alias gc='git commit -v'
alias gst='ua; git number'
alias ga='git number add'
alias gco='git checkout'
alias grh='git number reset head'
alias gd='git number diff'
alias gdc='git number diff --cached'
alias ge='git number -c'
alias gl='git pull'
alias gp='git push'
alias g='git'
alias gb='git branch'

bindkey -v '\e.' insert-last-word # alt + .

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line # Ctrl+X e

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -f ~/.zsh/includes.zsh ]; then
	source ~/.zsh/includes.zsh
fi

if [ -f ~/.zsh/startup.zsh ]; then
	source ~/.zsh/startup.zsh
fi

unsetopt correct

PATH='/usr/local/bin':$HOME/bin:$PATH
export PATH=~/dev/repos/colourbox/private/node_modules/.bin:$PATH

export EDITOR='mvim -v'
export GIT_EDITOR='mvim -v'
export VISUAL='mvim -v'
bindkey -v

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

alias tmux='TERM=screen-256color-bce tmux'
alias soz='source ~/.zshrc'

# Misc

if [[ "$OSTYPE" == "darwin"* ]]; then
	alias vim='mvim -v'
	function c () {
		echo $1 | tr -d '\n' | reattach-to-user-namespace pbcopy
	}
fi

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

hash -d d=~/Downloads
hash -d cb=~/dev/repos/colourbox
hash -d b=~/bin
hash -d r=~/dev/repos
hash -d g=~/dev/gists
hash -d db=~/Dropbox
hash -d tor=~/dev/repos/torp

alias gc='git commit -v'
alias gst='git number'
alias ga='git number add'
alias gcof='git number checkout'
alias gco='git checkout'
alias grh='git number reset head'
alias gr='git number rm'
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
bindkey '^v' edit-command-line # Ctrl+X e

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

chpwd() ls # ls after each cd

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias fzf='/Users/dmitry/.vim/bundle/fzf/fzf'

setopt RM_STAR_WAIT

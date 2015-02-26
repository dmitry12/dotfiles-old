# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

fpath=(~/.zsh/comp $fpath)
autoload -U compinit
compinit

if [ -f ~/.zsh/includes.zsh ]; then
	source ~/.zsh/includes.zsh
fi

if [ -f ~/.zsh/startup.zsh ]; then
	source ~/.zsh/startup.zsh
fi

unsetopt correct

PATH='/usr/local/bin':$HOME/bin:$PATH

bindkey -v

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

if [[ "$OSTYPE" == "darwin"* ]]; then
	alias vim='mvim -v'
	alias tmux='TERM=screen-256color-bce tmux'

	function c () {
		echo $1 | tr -d '\n' | reattach-to-user-namespace pbcopy
	}

	export EDITOR='mvim -v'
	export GIT_EDITOR='mvim -v'
	export VISUAL='mvim -v'

	alias -g C='| reattach-to-user-namespace pbcopy'
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

alias gst='git_status_shortcuts'
alias soz='source ~/.zshrc'
alias gn='geeknote'
alias fzf="$HOME/.vim/bundle/fzf/fzf"
alias se='source env.sh'

alias -g C='| xclip -in -selection clipboard'
alias -g G='| grep -i '
alias -g S='-sub '
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
#
#hash -d d=~/Downloads
hash -d cb=~/dev/repos/colourbox
hash -d r=~/dev/repos
hash -d db=~/Dropbox

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

setopt RM_STAR_WAIT
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

#. ~/.bin/z/z.sh
eval "$(fasd --init auto)"

GREP_COLOR="31" # Show red as match color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fzf

fkill() {
	ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

alias tmux='TERM=screen-256color-bce tmux'
alias vim='vim'

alias vs="vim --servername colourbox"
alias vst="vim --servername colourbox --remote-tab"
alias vsl="vim --serverlist"

function vsv() {
  vim --servername colourbox --remote-send "<C-\><C-n>:vnew ${1}<CR>"
}

function vss() {
  vim --servername colourbox --remote-send "<C-\><C-n>:split ${1}<CR>"
}

export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'

[ -s "/home/dmitry/.scm_breeze/scm_breeze.sh" ] && source "/home/dmitry/.scm_breeze/scm_breeze.sh"

export BROWSER=/usr/bin/chromium
alias iud="sudo ifdown wlan0 && sudo ifup wlan0"

sprunge() {
    cat | curl -F 'sprunge=<-' http://sprunge.us
}

alias tp='t | grep -Poh "\+\w+" | sort | uniq -u'
alias tproject=tp
alias tc='t | grep -Poh "\@\w+" | sort | uniq -u'
alias tcontext=tc

alias todo='t && printf "\n\nprojects:\n" && tp | tr "\\n" " " && printf "\n" && printf "contexts:\n" && tc | tr "\\n" " "'

export KEYTIMEOUT=25
bindkey -M viins jj vi-cmd-mode

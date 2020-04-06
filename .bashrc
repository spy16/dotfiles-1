#!/bin/bash

# history control
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

# turn on bash completion [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

alias cat='bat'

# ls aliases
alias ls='ls -G'

# grep aliases
alias grep='grep --color'

# git aliases
alias gpr='git pull --rebase'
alias gdc='git diff --cached'
alias gdf='git diff'
alias gap='git add -p'
alias gsp='git stash -p'
alias gst='git status'
alias watch='watch --color'
alias rm='rm -i'

alias pingoo="ping google.com"

#alias em='emacsclient --create-frame --no-wait -e "(x-focus-frame nil)"'
alias em='emacsclient --create-frame --no-wait'
export ALTERNATE_EDITOR=""

# Load rbenv automatically by appending
# the following to ~/.bash_profile:

if [[ $(command -v rbenv) ]]; then
  eval "$(rbenv init -)"
fi

if [[ $(command -v z) ]]; then
  . /usr/local/etc/profile.d/z.sh
fi

## prompt hackery
__prompt_command() {
  local EXIT="$?"             # This needs to be first
  PS1=""
  #local boxname=$(scutil --get ComputerName)
  local boxname=$(uname -n)

  local txtgrn='\[\e[1;32m\]' # Green
  local txtblu='\[\e[34m\]'   # Blue
  local txtwht='\[\e[1;37m\]' # White
  local txtrst='\[\e[0m\]'    # Text Reset
  local txtdim='\[\e[2m\]'    # dim

  # username@hostname
  PS1+="${txtwht}\u${txtrst}"
  PS1+="@"
  PS1+="${txtwht}${boxname}${txtrst}"

  # pwd
  PS1+=":${txtblu}\W${txtrst}"

  if [[ $EXIT -ne 0 ]]; then
    # last exit status
    PS1+=" ${txtdim}${EXIT}${txtrst}"
  fi

  # prompt
  PS1+=" $ "
}

PROMPT_COMMAND=__prompt_command

if [[ $(command -v fortune) && $(command -v cowsay) && $(command -v lolcat) ]]; then
  fortune | cowsay | lolcat
fi

function dockill() {
  docker stop $1 && docker rm $1
}

function ctags_ruby() {
  ctags -R --languages=ruby --exclude=.git
}

function ctags_python() {
  ctags -R --languages=python --exclude=.git
}

function ctags_java() {
  ctags -R --languages=python --exclude=.git
}

function ctags_c() {
  ctags -R --languages=c --exclude=.git
}

function genpass() {
  curl "https://www.random.org/strings/?num=10&len=15&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
}

if [[ -f ~/.bash_local.sh ]]; then
  source ~/.bash_local.sh
fi

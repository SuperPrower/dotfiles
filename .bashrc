#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

source ~/git-prompt.sh
PS1="\[$(tput sgr0)\]┌─[\[\033[38;5;4m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]]\$(__git_ps1 '(%s)')\n└─\\$ "

# =======
# aliases
# =======

alias startx="exec startx && exit"

alias ls='ls -g --color=auto'
alias lsv='command ls -lhA --color=auto'

# Dotfiles Repository
alias dotfiles='/usr/bin/git --git-dir=/media/data/dotfiles --work-tree=/home/superprower'

alias orphans='pacman -Qtdq'

# Useful variables
# Mostly moved to .profile

# Man pages color
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# ==============
# Useful aliases
# ==============

alias startx="exec startx && exit"

alias ls='ls -lhg --color=auto'

# Dotfiles Repository
alias dotfiles='/usr/bin/git --git-dir=/media/data/dotfiles --work-tree=/home/superprower'

# JetBrains toolbox fix
alias toolbox='jetbrains-toolbox --disable-seccomp-filter-sandbox'

alias orphans='pacman -Qtdq'

# ================
# Useful variables
# ================

export TERMINAL=xfce4-terminal
export EDITOR=nvim

export WALLPAPER="$HOME/wallpapers/city.jpg"
export LOCKSCREEN_IMAGE="$HOME/wallpapers/magenta_park.jpg"

# Man pages color
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

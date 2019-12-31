#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

source ~/git-prompt.sh
PS1="\[$(tput sgr0)\]┌─[\[\033[38;5;4m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]]\$(__git_ps1 '(%s)')\n└─\\$ "

# =======
# environmental variables
# ======

export QT_AUTO_SCREEN_SCALE_FACTOR=0

export TERMINAL=xfce4-terminal
export EDITOR=nvim

export WALLPAPER="/media/data/pictures/wallpapers/landscapes/foggy_forest.jpg"
export LOCKSCREEN_IMAGE="/media/data/pictures/wallpapers/magenta_park.jpg"

# XSecureLock

export XSECURELOCK_PASSWORD_PROMPT=asterisks
export XSECURELOCK_SAVER=saver_xscreensaver

## Workspaces, SDK locations, etc.

# Go Workspace
export GOPATH=/media/data/projects/golang

export NRF_SDK_ROOT="/media/data/projects/BLE/nRF5_SDK_15"

export PHANTOM_HOME="/media/data/phantomuserland"

# Sailfish SDK
# export PLATFORM_SDK_ROOT="/media/data/projects/OS/mer"
# alias sfossdk=$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot

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

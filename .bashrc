#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
bind -m vi-insert "\C-l":clear-screen

source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias la='ls -la'
alias vim='nvim'
alias v='nvim'
alias calc='bc -lq'

alias gs='git status'
alias gc='git commit -a'
alias ga='git add'
alias gp='git push'
alias gd='git diff'

export PS1='[\W] '
export HISTCONTROL=ignoredups
export EDITOR='nvim'
export TERM='st'
export PATH=$PATH:$HOME/.scripts

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
bind -m vi-insert "\C-l":clear-screen

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

PS1='[\u@\h \W]\$ '
export EDITOR='nvim'
export TERM='st'
export PATH=$PATH:$HOME/.scripts

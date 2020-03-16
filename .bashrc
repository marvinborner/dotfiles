#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
bind -m vi-insert "\C-l":clear-screen

alias ls='ls --color=auto'
alias vim='nvim'
alias v='nvim'
alias calc='bc -lq'

PS1='[\u@\h \W]\$ '

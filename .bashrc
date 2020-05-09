#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash options
set -o vi
bind -m vi-insert "\C-l":clear-screen
source /usr/share/bash-completion/bash_completion
export HISTCONTROL=ignoredups:erasedup
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Aliases
alias ls='ls --color=auto'
alias la='ls -lah'
alias vim='nvim'
alias v='nvim'
alias calc='bc -lq'
alias zat='zathura'

# Git aliases
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='nohup git push --quiet &> /dev/null &'
alias gd='git diff'

# Settings
export PS1='[\W] '
export HISTCONTROL=ignoredups
export BROWSER='qutebrowser'
export EDITOR='nvim'
export TERM='st'
export TERMINAL='st'
export PATH=$PATH:$HOME/.scripts:$HOME/.sailfish/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.cargo/bin
export GITHUB_TOKEN="$(cat "$HOME"/.crypto/github)"
export FZF_DEFAULT_COMMAND='rg --line-number --color never --no-heading ""'
export FZF_DEFAULT_OPTS='--bind ctrl-d:half-page-down,ctrl-u:half-page-up'

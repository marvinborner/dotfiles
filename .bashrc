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

# Aliases
alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -1'
alias ..='cd ..'
alias ...='cd ...'
alias -- -='cd -'
alias c='cd'
alias mv='mv -v'
alias cp='cp -v'
alias cls='clear; ls'
alias vim='nvim'
alias v='nvim'
alias calc='bc -lq'
alias zat='zathura'
alias pdf='zathura'
alias clip='xclip -selection c'
alias scrot='maim -us | clip -t image/png'
alias py='python3'
alias js='node'
alias script='script -q'
alias sudo='sudo '
alias please='sudo $(fc -ln -1)'

# Git aliases
alias gi='git init'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='nohup git push --quiet &> /dev/null &'
alias gd='git diff'
alias gr='git reset'

# Settings
export PS1='[\W] '
export HISTCONTROL=ignoredups
export BROWSER='qutebrowser'
export EDITOR='nvim'
export TERM='st'
export TERMINAL='st'
export JAVA_HOME=/usr/lib/jvm/default
export PATH=/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.scripts:$HOME/.sailfish/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.cargo/bin:$HOME/.local/bin:$JAVA_HOME:/opt/android-sdk/tools/bin:/opt/android-sdk/tools
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
export GITHUB_TOKEN="$(cat "$HOME"/.crypto/github)"
export UNCRUSTIFY_CONFIG="$HOME/.config/uncrustify.cfg"

# Finding
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='--bind ctrl-d:half-page-down,ctrl-u:half-page-up'
alias ff='fzf --preview '\''bat --style=numbers --color=always --line-range :500 {}'\'' --bind "enter:execute(nvim {})"'
alias tree='rg --files'

# Superuser customization
[ "$(id -u)" == "0" ] && export PS1="\[\e[01;31m\]$PS1\[\e[00m\]"

export CC=gcc
export EDITOR=vim
export VISUAL=$EDITOR
export TERM=alacritty
export TERMINAL=$TERM
export PAGER=less
export BROWSER=firefox
export SSH_ASKPASS=ssh-askpass
export PS1='\[\e]0;\us terminal\a\][\W] '

export LC_CTYPE="en_US.UTF-8"

export HISTFILE=$HOME/.history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoredups:erasedups:ignorespace

export LESS='-iMRS -x8'
export CLICOLOR=1

export UNCRUSTIFY_CONFIG=$HOME/.uncrustify.cfg

export ASAN_OPTIONS=verify_asan_link_order=0

umask 027

alias ls='ls --color=auto'
alias vi='vim'
alias v='vim'
alias zat='setsid -f zathura'

alias gi='git init'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='git push'
alias gd='git diff'
alias gr='git reset'
alias gl='git log'
alias gm='git mv'
alias gch='git checkout'

set -o noclobber # no > misuse; >| instead
#set -o nounset
set -o notify
set -o vi

stty susp undef
bind -x '"\C-z":"fg"'

. ~/.scripts/z.sh

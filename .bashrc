export CC=gcc
export EDITOR=vim
export VISUAL=$EDITOR
export TERM=alacritty
export TERMINAL=$TERM
export PAGER=less
export BROWSER=firefox
export SSH_ASKPASS=ssh-askpass
#export PS1='\[\e]0;\us terminal\a\][\W] '
export PS1='$(alacritty msg config window.title="$PWD")[\W] '

export LC_CTYPE="en_US.UTF-8"

export HISTFILE=$HOME/.history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoredups:erasedups:ignorespace

export LESS='-iMRS -x8'
export CLICOLOR=1

export UNCRUSTIFY_CONFIG=$HOME/.uncrustify.cfg

#export ASAN_OPTIONS=verify_asan_link_order=0

umask 027

alias c='cd'
alias ls='ls --color=auto'
alias l='ls'
alias vi='vim'
alias v='vim'
alias zat='setsid -f zathura'
alias mtoot='madonctl -i chaos.social toot'
alias toot='vipe | mtoot --stdin &>/dev/null || echo failure'
alias npm="node --dns-result-order=ipv4first $(which npm)"

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

disasm() { objdump -drwC -Mintel "$1" | less; }
disasmc() { objdump -drwC -Mintel --visualize-jumps=color "$1" | less -r; }

vg() { valgrind --trace-children=yes --track-fds=yes --log-fd=2 --error-limit=no --leak-check=full --show-possibly-lost=yes --track-origins=yes --show-reachable=yes "$@"; }

set -o noclobber # no > misuse; >| instead
#set -o nounset
set -o notify
set -o vi

f() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
			--phony -q "$1" \
			--bind "change:reload:$RG_PREFIX {q}" \
			--preview-window="70%:wrap"
	)" &&
		echo "opening $file" &&
		xdg-open "$file"
}

k() {
	local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

	if [ "x$pid" != "x" ]; then
		echo $pid | xargs kill -${1:-9}
		k
	fi
}

e() {
	$EDITOR $(rg --files | fzf)
}

. ~/.scripts/z.sh
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

stty susp undef
bind -x '"\C-z":"fg"'

[ -f "/home/melvin/.ghcup/env" ] && source "/home/melvin/.ghcup/env" # ghcup-env

#[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
#eval "$(atuin init bash)"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

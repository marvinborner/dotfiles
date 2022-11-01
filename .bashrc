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
alias mtoot='madonctl -i chaos.social toot'
alias toot='vipe | mtoot --stdin'
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

set -o noclobber # no > misuse; >| instead
#set -o nounset
set -o notify
set -o vi

stty susp undef
bind -x '"\C-z":"fg"'

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

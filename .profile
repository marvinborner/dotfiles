export ENV=$HOME/.okshrc

export EDITOR=vim
export TERM=mlterm
export TERMINAL=$TERM
export BROWSER=firefox

export PATH=$PATH:/home/melvin/.scripts:/home/melvin/.local/bin
export npm_config_prefix="$HOME/.local"
export LD_PRELOAD=/usr/lib/qt/qt5noblink.so
export MAKEFLAGS=-j12
export GNUMAKEFLAGS=$MAKEFLAGS

export SAVE_TEXTVIEW=less
export SAVE_CLIPCMD=clip

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx &>/dev/null
fi

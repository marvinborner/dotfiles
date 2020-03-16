#
# ~/.xinitrc
#

xbanish &
dunst &

xrdb -merge /home/melvin/.Xresources &
xset r rate 300 50 &
xsetroot -name "Melvin" &

exec dwm

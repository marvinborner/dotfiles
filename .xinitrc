#
# ~/.xinitrc
#

xbanish &
dunst &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl -option "caps:swapescape"
xsetroot -solid "#282c34"
xrdb -merge /home/melvin/.Xresources &
xset r rate 300 50 &

wmname LG3D &
environment &
dwm_time &

exec dwm

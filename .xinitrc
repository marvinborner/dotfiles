#
# ~/.xinitrc
#

xbanish &
dunst &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xrdb -merge /home/melvin/.Xresources &
xset r rate 300 50 &
wmname LG3D &
code &
dwm_time &

exec dwm

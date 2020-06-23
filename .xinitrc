#
# ~/.xinitrc
#

# Services
xbanish &
dunst &

# Keyboard settings
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl -option "caps:swapescape" &
xmodmap -e "keycode  135 = Super_R" &
xset r rate 300 50 &

# Interface
xsetroot -solid "#282c34" &
xrdb -merge /home/melvin/.Xresources &

# Window management
wmname LG3D &
environment &
dwm_time &

# GO!
exec dwm

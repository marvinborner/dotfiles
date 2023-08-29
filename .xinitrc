xbanish &
lxsession &

dunst &
inputset &

while true; do xsetroot -name "$(stats)"; sleep 10; done &
while true; do weather get; sleep 600; done &

for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
	[ -x "$f" ] && . "$f"
done
unset f

# copyq &
redshift -l 48.5:9.1 &
touchegg &

eval `ssh-agent -s`

xset +fp /usr/share/fonts/local
xset s 1200
xset dpms 1200 1200 1200
xss-lock -- slock &

#picom &
wallset &

wmname LG3D
xrdb ~/.Xresources

alacritty &
sleep 0.5
xdotool search --onlyvisible --class Alacritty windowunmap %@

timer run &

#nextcloud --background &

#obsidian &

#setsid -f arbtt-capture
exec dbus-run-session dwm
#exec dbus-launch dwm

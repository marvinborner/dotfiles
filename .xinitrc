xbanish &
lxsession &

inputset &

while true; do xsetroot -name "$(stats)"; sleep 10; done &
while true; do weather get; sleep 600; done &

for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
	[ -x "$f" ] && . "$f"
done
unset f

copyq &
redshift -l 48.5:9.1 &
xss-lock -- slock &

wmname LG3D
xrdb ~/.Xresources

obsidian &
dbus-run-session dwm

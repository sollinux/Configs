#!/bin/bash

#Add fonts
xset fp+ /usr/share/fonts/artwiz-ru-fonts/
xset fp rehash

#Keymap
setxkbmap -layout 'us,ru' -option 'grp:caps_toggle,grp_led:caps'

#Wallpaper
feh --bg-scale ~/images/dwm02.png &

#Player
mpd &

#Bar
sh ~/.conky_scripts/refresh.sh &
conky |  dzen2 -e '' -h 15 -x '0' -y '585' -bg '#111111' -fg '#bbbbbb' -fn '-*-nu-medium-r-normal-*-*-*-*-*-*-*-iso10646-*' -ta l &

#DWM statusbar (read fifo-file)
while true; do
	xsetroot -name "`cat /var/log/state_system`"
done&

#Start dwm
exec dwm

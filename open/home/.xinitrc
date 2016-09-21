#!/bin/sh

unset LC_ALL
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=""

setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout us -option ctrl:nocaps

xset +dpms
xset b off
xset s 300

xset +fp /home/chef/.fonts/
xset +fp /usr/local/share/fonts/terminus
xset +fp /usr/local/share/fonts/ohsnap
xset fp rehash

xrdb -load ~/.Xresources &

xsidle.sh slock &

#sxhkd &
#xbindkeys &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#6272a4'
feh --bg-fill $HOME/Pictures/wallpapers/TPXxScw.png &

#wew | focus_watcher.sh &
#exec xwait
#exec evilwm -term xterm -fn Ohsnap -fg '#282a36' -snap 10 -bw 2 -nosoliddrag
exec cwm

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
xset fp rehash

xrdb -load ~/.Xresources &

#xsidle.sh slock &

xbindkeys &

xsetroot -cursor_name left_ptr
xsetroot -solid #506070

#wew | focus_watcher.sh &
#exec xwait
exec evilwm -term xterm -fn fixed -fg '#eeeeee' -snap 20 -bw 2 -nosoliddrag

#!/bin/sh

unset LC_ALL
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=""

setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout us -option ctrl:nocaps

xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

xset +dpms
xset -b
xset s 300

xset +fp ~/.fonts
xset fp rehash

urxvtd -q -o -f &
xrdb < ~/.Xdefaults
xsidle.sh slock &

statusbar.sh &

xsetroot -cursor_name left_ptr
#hsetroot -fill ~/Pictures/walls/traffic.jpg -blur .5
xsetroot -mod 16 16 -bg "$(xrdb -query | awk '/\*background/ {print $2}')" -fg "$(xrdb -query | awk '/\*color8/ {print $2}')"

exec cwm
#exec evilwm

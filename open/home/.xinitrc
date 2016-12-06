#!/bin/sh

setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout us -option ctrl:nocaps

xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

xset +dpms
xset -b
xset s 300

xset +fp /usr/local/share/fonts/ohsnap
xset fp rehash

xrdb < ~/.Xdefaults

mpd ~/.config/mpd/mpd.conf &

xsetroot -cursor_name left_ptr
#feh --bg-fill --randomize ~/.wallpapers/* &
feh --bg-fill ~/Pictures/wallpapers/_DSF6699b_3000px_1500.jpg &

exec cwm

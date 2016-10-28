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

#xidle -timeout 300 -program "/usr/local/bin/slock" &

xsetroot -cursor_name left_ptr
xsetroot -mod 16 16 -bg "$(xrdb -query | awk '/\*.color6/ {print $2}')" \
-fg "$(xrdb -query | awk '/\*.color7/ {print $2}')"

exec cwm 


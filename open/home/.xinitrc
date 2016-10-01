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

xset +fp /home/chef/.fonts/
xset +fp /usr/local/share/fonts/terminus
xset +fp /usr/local/share/fonts/ohsnap
xset fp rehash

xrdb < ~/.Xdefaults

mpd ~/.config/mpd/mpd.conf &

xidle -timeout 300 -program "/usr/local/bin/slock" &

xsetroot -cursor_name left_ptr
xsetroot -solid '#33859d'

exec cwm

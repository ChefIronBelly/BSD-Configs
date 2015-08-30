#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

unset LC_ALL
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="" 

#xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources

export XCOL0=2a2a2a
export XCOL3=976c4e
export XCOL5=978a9b
export XCOL6=4a5e5b

sxhkd &
urxvtd &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#35465c'
hsetroot -fill ~/Pictures/wallpapers/5.png

wew | focus_watcher.sh &
exec xwait

#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

unset LC_ALL
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="" 

xset -dpms
xset s off
xset b off
#xset r 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources
sxhkd &

urxvtd &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#76535a'
hsetroot -fill ~/Pictures/wallpapers/green_background.jpg

wew | yawee &
exec xwait
# exec cwm

#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources

export XCOL0=000101
export XCOL1=010d13
export XCOL2=01181e
export XCOL3=02242c
export XCOL4=04333d
export XCOL5=074652
export XCOL6=0b5a68
export XCOL7=1185b4

sxhkd &
urxvtd &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#35465c'
hsetroot -fill ~/Pictures/wallpapers/testtube.png

wew | focus_watcher.sh &
exec xwait

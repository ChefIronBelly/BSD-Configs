#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources &

export XCOL0=222222
export XCOL1=aa4450
export XCOL2=719611
export XCOL3=cc8800
export XCOL4=6688aa
export XCOL5=8f6f8f
export XCOL6=528b8b
export XCOL7=d3d3d3

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/lakeside.jpg

wew | focus_watcher.sh &
exec wmutils

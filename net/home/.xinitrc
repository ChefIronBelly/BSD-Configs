#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources &

export XCOL0=2b2b2b
export XCOL1=272935
export XCOL2=3a4055
export XCOL3=5a647e
export XCOL4=d4cfc9
export XCOL5=e6e1dc
export XCOL6=f4f1ed
export XCOL7=f9f7f3

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/lakeside.jpg

wew | focus_watcher.sh &
exec wmutils

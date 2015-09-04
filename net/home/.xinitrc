#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources &

export XCOL0=3f3f3f
export XCOL1=705050
export XCOL2=60b48a
export XCOL3=f0dfaf
export XCOL4=506070
export XCOL5=dc8cc3
export XCOL6=8cd0d3
export XCOL7=dcdccc

sxhkd &
#urxvtd &

statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/flowers.jpg

wew | focus_watcher.sh &
exec xwait

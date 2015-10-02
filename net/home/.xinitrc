#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources &

export XCOL0=2b303b
export XCOL1=343d46
export XCOL2=4f5b66
export XCOL3=65737e
export XCOL4=a7adba
export XCOL5=c0c5ce
export XCOL6=dfe1e8
export XCOL7=eff1f5

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/ky7tee2.jpg

wew | focus_watcher.sh &
exec wmutils

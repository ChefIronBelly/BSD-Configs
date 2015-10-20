#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset -dpms
#xset s off
xset b off
xset r rate 200 30

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources &

export XCOL0=2d2d2d
export XCOL1=393939
export XCOL2=515151
export XCOL3=747369
export XCOL4=a09f93
export XCOL5=d3d0c8
export XCOL6=e8e6df
export XCOL7=f2f0ec

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/lakeside.jpg

wew | focus_watcher.sh &
exec wmutils

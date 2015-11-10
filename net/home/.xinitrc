#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xrdb -load ~/.Xresources &

export XCOL0=1C2023
export XCOL1=393F45
export XCOL2=565E65
export XCOL3=747C84
export XCOL4=ADB3BA
export XCOL5=C7CCD1
export XCOL6=DFE2E5
export XCOL7=F3F4F5

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#1C2023'
hsetroot -fill ~/Pictures/wallpapers/url.jpg
wew | focus_watcher.sh &
exec wmutils

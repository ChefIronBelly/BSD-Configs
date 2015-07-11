#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp
export LANG=en,US,UTF-8
export TERM=xterm

xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
devilspie -a &
xbindkeys &

xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

if [ -s ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

xsetroot -cursor_name left_ptr
#xsetroot -solid '#111111'
hsetroot -fill ~/Pictures/wallpapers/simpledesktops.jpg #-blur 1

exec evilwm

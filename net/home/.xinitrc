#!/bin/sh

setxkbmap -option terminate:ctrl_alt_bksp

xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
#xcompmgr &
devilspie -a &
xbindkeys &

#xset fp+ /usr/local/share/fonts/
xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

if [ -s ~/.Xresources ]; then
	 xrdb -merge ~/.Xresources
fi

xsetroot -cursor_name left_ptr
#xsetroot -solid '#111111'
hsetroot -fill ~/Pictures/wallpapers/simpledesktops.jpg #-blur 1

exec evilwm -snap 10 -bw 2

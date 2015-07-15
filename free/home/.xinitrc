#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp
export LANG=en,US,UTF-8
export TERM=xterm

xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
devilspie -a &
#xbindkeys &
sxhkd &

# turn off screen blanking and turn on energy star features
    xset s off
    xset dpms 600 60 60

xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

if [ -s ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

xsetroot -cursor_name left_ptr
xsetroot -solid '#222222'
#hsetroot -fill ~/Pictures/wallpapers/simpledesktops.jpg #-blur 1
#xclock  -chime -d -p 1 -twelve &

exec bspwm -c $HOME/.config/bspwm/bspwmrc


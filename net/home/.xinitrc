#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

unset LC_ALL
export LANG=en_US.UTF-8 
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES=C
export LC_TIME=en_US.UTF-8
export LC_ALL="" 

xcompmgr -FfCc &
devilspie -a &

xset -dpms
xset s off

xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

xrdb -load ~/.Xresources
xbindkeys &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/alex_gray.jpg & #-tint '#c7c7c7' & #-blur 1

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/pkg/bin/i3 -V -d all >> ~/.i3/logfile


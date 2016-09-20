#!/bin/sh
# set xsetroot color using dmenu

. $HOME/.wmrc

selection="$(dmenu -p "Color: $@")"
xsetroot -solid "#$selection"

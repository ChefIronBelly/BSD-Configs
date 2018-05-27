#!/bin/sh
# set xsetroot color using dmenu

selection="$(dmenu -p "Color: $@")"
xsetroot -solid "#$selection"

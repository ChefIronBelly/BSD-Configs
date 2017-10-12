#!/bin/sh
# ~/bin/uptime.sh
#

. $HOME/.wmrc

up="uptime: $(uptime)"

echo -n $up | osd_cat -p top -A center -d 5 -s 0 -c '#cfb9a8' -f $FONT

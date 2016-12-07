#!/bin/sh
# ~/bin/uptime.sh
#

. $HOME/.wmrc

up="uptime: $(uptime)"

echo -n $up | osd_cat -p top -A left -d 5 -s 0 -c '#3C4254' -f $FONT

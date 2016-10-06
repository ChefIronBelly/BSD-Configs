#!/bin/sh
# ~/bin/wetcat.sh
#

. $HOME/.wmrc

cw="$(weather.sh)"

echo -n $cw | osd_cat -p top -A center -d 5 -s 0 -c '#$FG' -f $FONT

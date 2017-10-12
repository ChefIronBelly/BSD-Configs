#!/bin/sh
# ~/bin/wetcat.sh
#
. $HOME/.wmrc
cw="$(weather.sh)"

echo -n $cw | osd_cat -p top -A center -d 10 -s 0 -o 12 -c '#cfb9a8' -f $FONT

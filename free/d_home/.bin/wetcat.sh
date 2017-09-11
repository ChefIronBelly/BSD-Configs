#!/bin/sh
# ~/bin/wetcat.sh
#

. $HOME/.wmrc
. $HOME/.colors/zenblue

cw="$(weather.sh)"

echo -n $cw | osd_cat -p top -A center -d 10 -s 0 -o 5 -c '#ffffff' -f $FONT

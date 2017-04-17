#!/bin/sh
# ~/bin/wetcat.sh
#

. $HOME/.wmrc
. $HOME/.colors/traffic

cw="$(weather.sh)"

echo -n $cw | osd_cat -p top -A center -d 10 -s 0 -o 13 -c '#cfb9a8' -f $FONT

#!/bin/sh

mus=$(mpc -f %artist% current)
sng=$(mpc -f %title% current)
if [ -z $mus ]; then
echo "Select a song."
else
echo "Now: " $mus - $sng
fi

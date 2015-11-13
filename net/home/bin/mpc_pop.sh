#!/bin/sh

mus=$(mpc -f %artist% current)
sng=$(mpc -f %title% current)
if [ -z $mus ]; then
echo "Select-o-matic"
else
echo "Now: " $mus - $sng
fi

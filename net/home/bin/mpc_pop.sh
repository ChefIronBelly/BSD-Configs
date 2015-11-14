#!/bin/sh

mus=$(mpc -f %artist% current)
sng=$(mpc -f %title% current)

if [[ $mus ]]; then
echo "[Select a song or update ID3 tags...]"
else
echo "[Now: " $mus - $sng"]"
fi

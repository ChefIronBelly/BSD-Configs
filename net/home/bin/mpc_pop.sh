#!/bin/sh

cur=$(mpc current)

if [[ $cur ]]; then
echo "[Select a song or update ID3 tags...]"
else
echo "[Now: " $cur"]"
fi

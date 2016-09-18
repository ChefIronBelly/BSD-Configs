#!/bin/sh

cur=$(mpc current)

if [ -z "$cur" ]; then
echo ""
else
echo "Now: $cur"
fi

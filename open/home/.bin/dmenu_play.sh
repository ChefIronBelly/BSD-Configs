#!/bin/sh
set -e
song="$(mpc playlist -f '%position% a:%artist% t:%title% b:%album%' |
	dmenu -f "$@" | sed -e 's/^\([0-9]*\).*$/\1/')"
if [ -n "$song" ]; then exec mpc -q play "$song"; fi

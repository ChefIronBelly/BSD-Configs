#!/bin/sh
# dkeg (2015)

## wallview

## An cool view of your current wall
## dependant on feh

# set your geometry as desired
# adjust $display as needed based; this is based on my setup
# for example; my config is ... hsetroot -fill /data/walls/wall.jpg &
# the -R .01 is redraw. Without it, the preview comes up blank at first

geom='-g 450x300+500+200'
params="-R .01 --zoom fill"
display=$(cat ~/.xinitrc|grep hsetroot|cut -d ' ' -f3,4|awk '{sub(/&/,"");print}')

feh $geom $params $display

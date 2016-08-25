#!/bin/sh

. $HOME/.wmrc

# alpha
a="#cc"
b="#00"

# default colors
bg="${a}${C0}"
fg="${a}${C7}"
sp="${a}${C4}"

# default geometry
default_geometry() {
width=x # values like 1280, 1440, 1920, etc
height=20
offy=0
offx=0

echo "${width}x${height}+${offx}+${offy}"
}

GEOM=${GEOM:-$(default_geometry)}

statusbar() {
	
groups() {
    groups=$(gind.sh)
    echo $groups
}

muzac() {
	muzac=$(cmus-info)
    echo $muzac
}

dateclock() {
    datetime=$(date +" %a, %b %d")
    echo $datetime
}

clock() {
    time=$(date +" %I:%M %p")
    echo $time
}

echo %{l}%{F${sp}}" "%{F-}%{F${fg}}$(groups)%{F-}%{F${sp}}%{F-}%{c}%{F${sp}}%{F-}%{F${fg}}$(dateclock)%{F-}%{F${fg}}" - "%{F-}%{F${fg}}$(clock)%{r}%{F-}%{F${fg}}$(muzac)" "%{F-}
}

while true
 do
   echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -f $ICOFONT -B $bg

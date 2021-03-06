#!/bin/sh

. $HOME/.wmrc

# alpha
a="#cc"
b="#00"

# default colors
bg="${a}${C0}"
fg="${a}${C7}"
sp="${a}${C1}"

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
	
x11ind() {
	x11ind=$(x11fsind)
	echo $x11ind
}

groups() {
    groups=$(gind.sh)
    echo $groups
}

mem() {
	mem=$(freecolor -o | awk 'NR==2 {print substr($3,0,3)}')
	echo $mem
}

ip() {
    ip=$(if_ip.sh)
    echo $ip
}

sound() {
  SOUND=$( ( mixer -s vol 2> /dev/null || echo - ) | cut -d ':' -f 2 )
  if [ ${SOUND} -ge 75 ]; then
    SIGNAL="%{F${fg}} $SOUND%{F-}"
  elif [ ${SOUND} -ge 50 ]; then
    SIGNAL="%{F${fg}} $SOUND%{F-}"
  elif [ ${SOUND} -ge 25 ]; then
    SIGNAL="%{F${fg}} $SOUND%{F-}"
  elif [ ${SOUND} -ge 1 ]; then
    SIGNAL="%{F${fg}} $SOUND%{F-}"
  elif [ ${SOUND} -eq 0 ]; then
    SIGNAL="%{F${fg}} $SOUND%{F-}"
  fi
  echo $SIGNAL
}

dateclock() {
    datetime=$(date +" %a, %b %d")
    echo $datetime
}

clock() {
    time=$(date +" %I:%M")
    echo $time
}

#%{F-}%{F${fg}}$(x11ind)%{F-}
echo %{l}%{F${sp}}" | "%{F-}%{F${fg}}"0x"$(groups)%{F-}%{F${sp}}" | "%{F-}%{r}%{F${sp}}" | "%{F-}%{F${fg}} $(mem)%{F-}%{F${sp}}" | "%{F-}%{F${fg}} $(ip)%{F-}%{F${sp}}" | "%{F-}$(sound)%{F${sp}}" | "%{F-}%{F${fg}} $(dateclock)%{F-}%{F${sp}}" | "%{F-}%{F${fg}} $(clock)%{F-}%{F${sp}}" | "%{F-}
}

while true
 do
   echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -f $ICOFONT -B $bg

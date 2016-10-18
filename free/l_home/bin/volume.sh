#!/bin/sh

device=vol
inc=10
volume=`mixer $device | cut -d ":" -f 2`
X=0

case $1 in
	- )
		X=$((${volume} - ${inc}))
		mixer -s $device $X:$X 2>/dev/null;;
	+ )
		X=$((${volume} + ${inc}))
		mixer -s $device $X:$X 2>/dev/null;;
	0 )
		if [ ${volume} != "0" ]; then
			mixer -s $device 0,0
		else
			mixer -s $device 208,208
		fi
		;;
esac

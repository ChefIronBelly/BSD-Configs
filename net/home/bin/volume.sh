#!/bin/sh

device=outputs.master
inc=10
volume=`mixerctl $device | cut -d "," -f 2`
X=0

case $1 in
	- )
		X=$((${volume} - ${inc}))
		mixerctl -w $device=$X,$X 2>/dev/null;;
	+ )
		X=$((${volume} + ${inc}))
		mixerctl -w $device=$X,$X 2>/dev/null;;
	0 )
		if [ ${volume} != "0" ]; then
			mixerctl -w $device=0,0
		else
			mixerctl -w $device=208,208
		fi
		;;
esac

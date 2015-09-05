#!/bin/sh

device=outputs.master
inc=10
volume=`mixerctl outputs.master | cut -d "," -f 2`
X=0

case $1 in
	9 )
		X=$((${volume} + ${inc}))
		mixerctl -w $device=$X,$X >/dev/null;;
	8 )
		X=$((${volume} - ${inc}))
		mixerctl -w $device=$X,$X >/dev/null;;
	0 )
		if [ ${volume} != "0" ]; then
			mixerctl -w $device=0,0
		else
			mixerctl -w $device=208,208
		fi
		;;
esac

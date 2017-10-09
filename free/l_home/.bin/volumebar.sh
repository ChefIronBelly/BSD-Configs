#!/bin/sh

#$( ( mixer -s vol 2> /dev/null || echo - ) | cut -d ':' -f 2 )/$( ( mixer -s pcm 2> /dev/null || echo - ) | cut -d ':' -f 2 )

volume_output=$( ( mixer -s vol 2> /dev/null || echo - ) | cut -d ':' -f 2 )/$( ( mixer -s pcm 2> /dev/null || echo - ) | cut -d ':' -f 2 )
left_volume=`echo $volume_output | cut -d "," -f 1`
right_volume=`echo $volume_output | cut -d "," -f 2`

volume_average=$(( ($left_volume+$right_volume)/2 ))
volume_percent=$(( 100*$volume_average/255 ))

echo "$volume_percent% " 

#!/bin/sh

#mute_state=`mixerctl outputs.master.mute | cut -d "=" -f 2`

volume_output=`mixerctl outputs.master | cut -d "=" -f 2`
left_volume=`echo $volume_output | cut -d "," -f 1`
right_volume=`echo $volume_output | cut -d "," -f 2`

volume_average=$(( ($left_volume+$right_volume)/2 ))
volume_percent=$(( 100*$volume_average/255 ))

#if [ "$mute_state" = "on" ]; then
#  volume_icon="$(icon spkr_02 warn)"
#else
#  volume_icon="$(icon spkr_01)"
#fi

echo "$volume_percent% " 

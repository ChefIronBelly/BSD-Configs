#!/bin/sh

volume_output=`mixerctl outputs.master | cut -d "=" -f 2`
left_volume=`echo $volume_output | cut -d "," -f 1`
right_volume=`echo $volume_output | cut -d "," -f 2`

volume_average=$(( ($left_volume+$right_volume)/2 ))
volume_percent=$(( 100*$volume_average/255 ))

echo "$volume_percent " 

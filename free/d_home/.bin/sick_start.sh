#!/bin/sh

echo "Starting nzbget"
sudo nzbget -D &
pid_job_1=$!
wait $pid_job_1
echo "Started nzget..."

echo "Starting transmission"
transmission-daemon &
pid_job_2=$!
wait $pid_job_2
echo "Started transmission..."

echo "cd /Source/SickGear"
cd ~/Source/SickGear

echo "Starting SickGear..."
python sickbeard.py --datadir ~/Source/SickGear/data/ &
pid_job_3=$!
wait $pid_job_3
echo "Started SickGear..."

#!/bin/sh

echo "cd /Source/CouchPotatoServer"
cd ~/Source/CouchPotatoServer
echo "Starting CouchPotatoServer"
sudo python CouchPotato.py &
pid_job_4=$!
wait $pid_job_4
echo "Started CouchPotato"

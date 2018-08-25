#!/bin/sh

memtotal="$(($(sysctl -n hw.physmem64) / 1024 / 1024))"
memused="$(($(vmstat | awk 'END {printf $3}') / 1024))"
mem="${memused}mb"
echo $mem

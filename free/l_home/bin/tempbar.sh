#!/bin/sh

temp="temp: $(sysctl -n dev.cpu.0.temperature | awk '{print $1*9/5+32}')"
echo $temp

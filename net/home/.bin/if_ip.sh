#! /bin/sh

ifconfig | grep -v 127.0.0.1 | grep -q "inet " || {
  echo -n "none "
  exit 1
  }

for I in $( ifconfig -l | sed s/lo0//g )
do
  ifconfig ${I} | grep -q "inet " && {
    echo  -n "${I}/"
    ifconfig ${I} | grep "inet " | awk '{print $2}' | tr '\n' ' '
  }
done

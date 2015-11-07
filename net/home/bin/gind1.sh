#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}
group1=""

if [ -f $FSDIR/group.1 ];
    then group1="1"
    else group1="0"
fi

echo "$group1"

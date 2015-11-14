#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group1=""

if [ -f $FSDIR/1 ];
    then group1="1"
    else group1="0"
fi

echo "$group1"

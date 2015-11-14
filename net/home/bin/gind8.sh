#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group8=""

if [ -f $FSDIR/8 ];
    then group8="1"
    else group8="0"
fi

echo "$group8"


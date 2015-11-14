#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group3=""

if [ -f $FSDIR/3 ];
    then group3="1"
    else group3="0"
fi

echo "$group3"

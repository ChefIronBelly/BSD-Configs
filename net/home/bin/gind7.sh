#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group7=""

if [ -f $FSDIR/7 ];
    then group7="1"
    else group7="0"
fi

echo "$group7"


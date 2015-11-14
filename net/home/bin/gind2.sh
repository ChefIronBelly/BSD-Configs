#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group2=""

if [ -f $FSDIR/2 ];
    then group2="1"
    else group2="0"
fi

echo "$group2"



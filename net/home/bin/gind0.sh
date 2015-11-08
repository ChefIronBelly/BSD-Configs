#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}
group0=""

if [ -f $FSDIR/group.1 ];
    then group0="1"
    else group0="0"
fi

echo "$group0"


#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}
group2=""

if [ -f $FSDIR/group.3 ];
    then group2="1"
    else group2="0"
fi

echo "$group2"



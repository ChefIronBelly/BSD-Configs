#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}
group3=""

if [ -f $FSDIR/group.3 ];
	then group3=""
    else group3=""
fi

echo "$group3"

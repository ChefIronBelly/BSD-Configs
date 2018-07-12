#!/bin/sh

# add test directory first

FSDIR=${FSDIR:-/tmp/groups}

if [ "$(ls -A $FSDIR/1)" ]; then
	group1="1"
	else group1="0"
fi

if [ "$(ls -A $FSDIR/2)" ]; then
	group2="1"
	else group2="0"
fi

if [ "$(ls -A $FSDIR/3)" ]; then
	group3="1"
	else group3="0"
fi

if [ "$(ls -A $FSDIR/4)" ]; then
	group4="1"
	else group4="0"
fi

echo "$group4""$group3""$group2""$group1"

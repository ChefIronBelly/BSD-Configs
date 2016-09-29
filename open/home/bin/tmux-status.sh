#!/bin/sh

FULL=▓
EMPTY=░
EOL=▒ 
SIZE=7
C0="#282828"
C1="#cc241d"
C2="#98971a"
C3="#d79921"
C4="#458588"
C5="#b16286"
C6="#689d6a"
C7="#a89984"

clock()
{
	mtime=$(date +'%H:%M')
	myear=$(date +'%Y-%m-')
	mday=$(date +'%d')
	echo "#[fg=$C0]#[bg=$C5]$mtime"
}

echo `clock`

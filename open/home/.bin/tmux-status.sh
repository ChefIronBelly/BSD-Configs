#!/bin/sh

FULL=▓
EMPTY=░
EOL=▒ 
SIZE=7
C0="#101010"
C1="#252525"
C2="#464646"
C3="#525252"
C4="#ababab"
C5="#b9b9b9"
C6="#e3e3e3"
C7="#f7f7f7"

clock()
{
	mtime=$(date +'%H:%M')
	myear=$(date +'%Y-%m-')
	mday=$(date +'%d')
	echo "#[fg=$C7]#[bg=$C1] $mtime"
}

echo `clock`

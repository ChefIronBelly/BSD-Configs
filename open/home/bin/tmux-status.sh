#!/bin/sh

FULL=▓
EMPTY=░
EOL=▒ 
SIZE=7
C0="#282a36"
C1="#ff5555"
C2="#50fa7b"
C3="#f1fa8c"
C4="#6272a4"
C5="#bd93f9"
C6="#8be9fd"
C7="#f8f8f2"

clock()
{
	mtime=$(date +'%H:%M')
	myear=$(date +'%Y-%m-')
	mday=$(date +'%d')
	echo "#[fg=$C0]#[bg=$C5]$mtime"
}

echo `clock`

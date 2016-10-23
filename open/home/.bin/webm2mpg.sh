#!/bin/sh
# chef
# extract .mp3 from .webm

OPTS="-acodec libmp3lame -ac 2 -aq 128k"

for FILE in *.webm ; do
    OUTNAME=`basename "$FILE" .webm`.mp3
    ffmpeg -i "$FILE" $OPTS "$OUTNAME"
done

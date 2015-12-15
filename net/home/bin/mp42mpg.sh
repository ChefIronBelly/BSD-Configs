#!/bin/sh
# chef
# convert .mp4 to .mpg using ffmpeg

OPTS="-acodec libmp3lame -ac 2 -aq 128k"

for FILE in *.mp4 ; do
    OUTNAME=`basename "$FILE" .m4a`.mp3
    ffmpeg2 -i "$FILE" $OPTS "$OUTNAME"
done

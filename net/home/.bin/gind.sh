#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups}
group1=""
group2=""
group3=""
group4=""

[ "$(ls -A /tmp/groups/1)" ] && group1="1" || group1="0"
[ "$(ls -A /tmp/groups/2)" ] && group2="1" || group2="0"
[ "$(ls -A /tmp/groups/3)" ] && group3="1" || group3="0"
[ "$(ls -A /tmp/groups/4)" ] && group4="1" || group4="0"

echo "$group4""$group3""$group2""$group1"

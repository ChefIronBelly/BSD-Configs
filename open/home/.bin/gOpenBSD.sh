#!/usr/local/bin/bash
#
# Get OpenBSD snapshots
#
set -e
set -x

now=$(date +"%m.%d")
mkdir /home/chef/snapshots/${now} && cd $_

ftp -ia ftp://mirror.csclub.uwaterloo.ca/pub/OpenBSD/snapshots/amd64/{index.txt,*tgz,bsd*,INS*,BOOT*,BUILDINFO,SHA*}

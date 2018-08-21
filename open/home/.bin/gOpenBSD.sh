#!/bin/sh
#
# Get OpenBSD snapshots
#
ftp -ia ftp://mirror.csclub.uwaterloo.ca/pub/OpenBSD/snapshots/amd64/{index.txt,*tgz,bsd*,INS*,BOOT*,BUILDINFO,SHA*}

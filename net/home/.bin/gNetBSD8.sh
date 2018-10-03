#!/usr/pkg/bin/bash
#
# Get NetBSD-8 sets
#
# depends: curl and common sense

set -e
set -x

now=$(date +"%m%d%I%M""Z")
mkdir /home/chef/netbsd-8/${now} && cd $_

for file in kern-GENERIC modules base comp etc man text xbase xcomp xetc xfont xserver
do
    curl -C - -LO http://nyftp.netbsd.org/pub/NetBSD-daily/netbsd-8/latest/amd64/binary/sets/${file}.tgz
done

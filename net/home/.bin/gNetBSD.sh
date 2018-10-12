#!/usr/pkg/bin/bash
#
# Get NetBSD daily sets
#
# depends: curl and common sense

set -e
set -x

now=$(date +"%Y%m%d%I%M""Z")
mkdir /home/chef/HEAD/${now} && cd $_

for file in kern-GENERIC modules base comp etc man text xbase xcomp xetc xfont xserver
do
    curl -C - -LO http://nyftp.netbsd.org/pub/NetBSD-daily/HEAD/latest/amd64/binary/sets/${file}.tar.xz
done

#!/usr/pkg/bin/bash
#
# unpack NetBSD daily sets
#
# depends: common sense
### work in progress ###

set -e
set -x

cd /
pwd
read

cp /netbsd /netbsd.old

for file in kern-GENERIC modules base comp xbase xcomp xfont xserver
do
	tar zxpf /home/chef/HEAD/$1/${file}.tgz
done

# hand job this you lazy bastage #

# /usr/sbin/postinstall -s /home/chef/HEAD/etc.tgz check
# /usr/sbin/postinstall -s /home/chef/HEAD/etc.tgz fix
# /usr/sbin/etcupdate -s /home/chef/HEAD/etc.tgz


#!/usr/pkg/bin/bash
#
# unpack NetBSD daily sets
#
# depends: common sense
### work in progress ###

set -e
set -x

for file in base comp kern-GENERIC modules xbase xcomp xfont xserver
do
	tar zxpf /home/chef/HEAD/$1/${file}.tgz
done

# wrong stomps on kernel #
#tar -zxpf /home/chef/HEAD/$1/kern-GENERIC.tgz
#ln -fh /netbsd /netbsd.old
#cp /home/chef/HEAD/$1/netbsd /netbsd.new
#ln -fh /netbsd.new /netbsd

#for file in etc xetc
#do
#	/usr/sbin/postinstall -s ~/${file}.tgz check
#    /usr/sbin/postinstall -s ~/${file}.tgz fix
#    /usr/sbin/etcupdate -s ~/${file}.tgz
#done

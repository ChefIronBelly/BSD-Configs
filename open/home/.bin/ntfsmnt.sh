#! /bin/sh

# Mount ntfs
# sysctl hw.disknames
# dmesg | grep sd6
# disklabel sd6

doas mount_ntfs /dev/sd6i /mnt/ntfs

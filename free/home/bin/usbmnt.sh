#!/bin/sh
# dev/sd0e or sd4e on my machines #netbsd
# dev/da4 on my machines #netbsd

# fdisk ada4

# sudo mount_msdos /dev/sd4e /mnt #netbsd
sudo mount_msdosfs /dev/da4s1  /mnt/usb #freebsd
#sudo mount -t ntfs -o ro /dev/ada4s1 /mnt #ntfs

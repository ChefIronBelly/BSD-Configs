#! /bin/sh
# dev/sd0e or sd4e on my machines #netbsd
# dev/da4 on my machines #netbsd
# sudo newfs_msdos /dev/da0 #freebsd format usb

# sudo mount_msdos /dev/sd4e /mnt #netbsd
sudo mount_msdosfs /dev/da0s1  /mnt/usb #freebsd

#	$NetBSD: rc.conf,v 1.96 2000/10/14 17:01:29 wiz Exp $
#
# see rc.conf(5) for more information.
#
# Use program=YES to enable program, NO to disable it. program_flags are
# passed to the program on the command line.
#

# Load the defaults in from /etc/defaults/rc.conf (if it's readable).
# These can be overridden below.
#
if [ -r /etc/defaults/rc.conf ]; then
	. /etc/defaults/rc.conf
fi

# If this is not set to YES, the system will drop into single-user mode.
#
rc_configured=YES

# Add local overrides below
#
hostname=niflheim
dhcpcd=YES
dhcpcd_flags="-qM ral0"
wscons=YES
dhclient=NO
wpa_supplicant=YES
wpa_supplicant_flags="-B -i ral0 -c /etc/wpa_supplicant.conf"
savecore=NO
rpcbind=YES

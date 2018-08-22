#include <sys/ioctl.h>
#include <sys/param.h>
#include <sys/audioio.h>
#include <sys/sensors.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
/*
 * XXX: All this for IFA_IN6(x) seems hackish
 */
#include <net/if.h>		/* IFNAMISZ */
#include <netinet/in.h>
#include <netinet6/in6_var.h>	/* IFA_IN6(x) */
#include <netdb.h>

#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <ifaddrs.h>
#include <machine/apmvar.h>
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include <X11/Xlib.h>

#include "config.h"

#define WRET(s, r)	do { warn(s); return (r); } while(0)

static Display	*dpy;
static char	 stat[MAX_LEN];

static char		 cputemp(void);
static const char	*ip(const char *);
static const char	*timedate(void);
static char		 volume(void);
static void		 handler(int);


static char
cputemp(void)
{
	static struct		sensor sn;
	static size_t		sn_sz = sizeof(sn);
	static const int	mib[5]	= {CTL_HW, HW_SENSORS,
				    0, SENSOR_TEMP, 0};

	if (sysctl(mib, 5, &sn, &sn_sz, NULL, 0) == -1)
		WRET("cputemp", -1);

	return ((sn.value - 273150000LL) / 1000000LL);
}

static const char *
ip(const char *name)
{
	static struct ifaddrs	*ifap, *ifa;
	static sa_family_t	 af;
	static char		 addr[NI_MAXHOST];

	if (getifaddrs(&ifap) == -1) {
		warn("getifaddrs");
		addr[0] = '!';
		addr[1] = '\0';
		return (addr);
	}

	for (ifa = ifap; ifa != NULL; ifa = ifa->ifa_next) {
		if (ifa->ifa_addr == NULL ||
		    strcmp(ifa->ifa_name, name) != 0 ||
		    (((af = ifa->ifa_addr->sa_family) == AF_INET6 &&
		      IN6_IS_ADDR_LINKLOCAL(IFA_IN6(ifa))) ||
		     af != AF_INET))
			continue;

		if (getnameinfo(ifa->ifa_addr, sizeof(ifa->ifa_addr),
		    addr, sizeof(addr), NULL, 0, NI_NUMERICHOST) != 0) {
			warn("getnameinfo");
			addr[0] = '!';
			addr[1] = '\0';
		}
		break;
	}

	freeifaddrs(ifap);
	if (ifa == NULL) {
		addr[0] = '-';
		addr[1] = '\0';
	}
	return (addr);
}

static const char *
timedate(void)
{
	static time_t		 t;
	static struct tm	*tm;
	static char 		 s[64];

	if ((t = time(NULL)) == (time_t) - 1 ||
	    (tm = localtime(&t)) == NULL ||
	    strftime(s, sizeof(s), TIMEFMT, tm) == 0)
		WRET("timedate", "!");

	return (s);
}

static char
volume(void)
{
	static int			cls = -1, fd, v;
	static struct mixer_devinfo	mdi;
	static struct mixer_ctrl	mc;

	if ((fd = open("/dev/mixer", O_RDONLY)) == -1)
		WRET("volume", -1);

	for (mdi.index = 0; cls == -1; ++mdi.index) {
		if (ioctl(fd, AUDIO_MIXER_DEVINFO, &mdi) == -1)
			goto fail;
		if (mdi.type == AUDIO_MIXER_CLASS &&
		    strcmp(mdi.label.name, AudioCoutputs) == 0)
			cls = mdi.index;
	}
	for (mdi.index = 0, v = -1; v == -1; ++mdi.index) {
		if (ioctl(fd, AUDIO_MIXER_DEVINFO, &mdi) == -1)
			goto fail;
		if (mdi.type == AUDIO_MIXER_VALUE &&
		    mdi.prev == AUDIO_MIXER_LAST &&
		    mdi.mixer_class == cls &&
		    strcmp(mdi.label.name, AudioNmaster) == 0) {
			mc.dev = mdi.index;
			if (ioctl(fd, AUDIO_MIXER_READ, &mc) == -1)
				goto fail;
			v = MAX(mc.un.value.level[AUDIO_MIXER_LEVEL_MONO],
			        mc.un.value.level[AUDIO_MIXER_LEVEL_RIGHT]);
		}
	}

	if (v == -1 || close(fd) == -1)
		WRET("volume", -1);

	return (v * 100 / 255);
fail:
	(void)close(fd);
	WRET("volume", -1);
}

static void
handler(const int sig)
{
	const int	save_errno = errno;

	psignal((unsigned int)sig, "caught signal");
	switch (sig) {
	case SIGINT:
	case SIGTERM:
		(void)XCloseDisplay(dpy);
		exit(0);
	case SIGALRM:
	case SIGHUP:
		break;
	case SIGINFO:
		if (puts(stat) == EOF)
			warn("puts");
		break;
	}

	errno = save_errno;
}

int
main(int argc, char **argv)
{
	static int		 dflag = 0, r;
	static const int	 s[] = {SIGHUP, SIGINT, SIGABRT,
				     SIGTERM, SIGINFO};

	if (argc > 1) {
		if (argc == 2 && strcmp(argv[1], "-d") == 0)
			dflag = 1;
		else {
			fprintf(stderr, "usage: %s [-d]\n", getprogname());
			return (1);
		}
	}
	if (!dflag && daemon(1, 1) == -1)
		err(1, "daemon");

	for (r = 0; r < (int)nitems(s); ++r)
		if (signal(s[r], handler) == SIG_ERR)
			err(1, "signal");

	if ((dpy = XOpenDisplay(NULL)) == NULL)
		errx(1, "cannot open display");

loop:
	if ((r = snprintf(stat, MAX_LEN, OUTFMT, ip(INTERFACE), cputemp(),
	 volume(), timedate())) == -1)
		warn("snprintf");
	else if (r >= MAX_LEN)
		warnx("status exceeds MAX_LEN");
	else {
		(void)XStoreName(dpy, DefaultRootWindow(dpy), stat);
		(void)XSync(dpy, False);
	}
	(void)sleep(INTERVAL);
	goto loop;

	/* unreachable */
	return (0);
}

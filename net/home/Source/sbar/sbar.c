#define  _DEFAULT_SOURCE

#include <arpa/inet.h>
#include <ctype.h>
#include <ifaddrs.h>
#include <netdb.h>


#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <strings.h>

#include <sys/time.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <time.h>
#include <unistd.h>
#include <X11/Xlib.h>

char *utcusa = "America/New_York";

static Display *dpy;

char *smprintf(char *fmt, ...) {
	va_list fmtargs;
	char *ret;
	int len;

	va_start(fmtargs, fmt);
	len = vsnprintf(NULL, 0, fmt, fmtargs);
	va_end(fmtargs);

	ret = malloc(++len * sizeof(char));
	if (ret == NULL) {
		perror("malloc");
		exit(1);
	}

	va_start(fmtargs, fmt);
	vsnprintf(ret, len, fmt, fmtargs);
	va_end(fmtargs);

	return ret;
}

void settz(char *tzname){
	setenv("TZ", tzname, 1);
}

char *mktimes(char *fmt, char *tzname){
	char buf[129];
	time_t tim;
	struct tm *timtm;

	memset(buf, 0, sizeof(buf));
	settz(tzname);
	tim = time(NULL);
	timtm = localtime(&tim);
	if (timtm == NULL) {
		perror("mktimes: localtime returned null");
	}

	if (!strftime(buf, sizeof(buf)-1, fmt, timtm)) {
		perror("strftime == 0");
	}

	return smprintf("%s", buf);
}

char* getaddr(){

	int family, s, n;
	struct ifaddrs *ifaddr, *ifa;
	if (getifaddrs(&ifaddr) == -1){
		fprintf(stderr, "getaddr: getifaddrs returned -1");
	}

	char host[NI_MAXHOST];
	char *ret_host = NULL;

	for(ifa = ifaddr, n = 0; ifa != NULL; ifa = ifa->ifa_next, n++) {
		if ((ifa->ifa_addr == NULL) || (strcmp(ifa->ifa_name, "lo") == 0)) continue;

		family = ifa->ifa_addr->sa_family;

		if (family == AF_INET) {
			s = getnameinfo(ifa->ifa_addr, (family == AF_INET) ? sizeof(struct sockaddr_in):sizeof(struct sockaddr_in6), host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);
			if (s != 0) {
				freeifaddrs(ifaddr);
				fprintf(stderr, "getnameinfo() failed.\n");
				return NULL;
			}
			if (ret_host == NULL) {
				ret_host = smprintf("%s", host);
			} else {
				char *temp_host = ret_host;
				ret_host = smprintf("%s", ret_host);
				free(temp_host);
			}
		}
	}
	freeifaddrs(ifaddr);
    return ret_host;
}

void setStatus(char *str){
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

char* getStatus(int mode) {
	
	char* tmusa;
	char* host;
	char* tempStatus;
	
	host = getaddr();
	tmusa = mktimes("%a, %b %d @ %I:%M", utcusa);

	tempStatus = smprintf("ip: %s | %s", host, tmusa);
	
	free(tmusa);
	free(host);
	
	return tempStatus;
}

int main(int argc, char* argv[]){

	int mode;
    int opt;
	char *status;

	if (!(dpy = XOpenDisplay(NULL))) {
		fprintf(stderr, "sbar: cannot open display.\n");
		return 1;
	}

	while ((opt = getopt(argc, argv, "b")) != -1) {
		if (opt == 'b') {
			mode += 1;
		} else {
			fprintf(stderr, "Usage: %s [-b]\n", argv[0]);
			exit(EXIT_FAILURE);
		}
	}
	for (;;sleep(90)) {
		status = getStatus(mode);
		setStatus(status);
		free(status);
	}

	XCloseDisplay(dpy);

	return 0;
}


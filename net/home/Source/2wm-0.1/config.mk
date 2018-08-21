# 2wm version
VERSION = 0.1

# Customize below to fit your system

# paths
PREFIX = /usr/pkg
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/X11R7/include
X11LIB = /usr/X11R7/lib

# includes and libs
INCS = -I. -I/usr/include -I${X11INC}
LIBS = -L/usr/lib -lc -L${X11LIB} -lX11

# flags
#CFLAGS = -Os ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}
#CFLAGS = -g -Wall -O2 ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = -g ${LIBS}

# flags
CPPFLAGS = -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS   = -I/usr/pkg/include -I/usr/X11R7/include -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = -Wl,-R/usr/X11R7/lib -L/usr/X11R7/lib -s ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}
#CFLAGS += -xtarget=ultra

# compiler and linker
CC = cc

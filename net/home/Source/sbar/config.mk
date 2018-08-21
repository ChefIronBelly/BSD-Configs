NAME = sbar
VERSION = 1.2

# Customize below to fit your system

# paths
PREFIX = /usr/pkg
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/X11R7/include
X11LIB = /usr/X11R7/lib

# includes and libs
INCS = -I/usr/pkg/include -I/usr/X11R7/include -std=c99 -pedantic -Wall -Os
LIBS = -Wl,-R/usr/X11R7/lib -L/usr/X11R7/lib -lc -lX11

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\"
CFLAGS = -Wall ${INCS} ${CPPFLAGS}
#CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS = ${LIBS}
#LDFLAGS = -s ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc


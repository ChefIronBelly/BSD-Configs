PREFIX = /usr/pkg
MANPREFIX = $(PREFIX)/man

CC      = cc
LD      = $(CC)

CFLAGS  = -I/usr/pkg/include -I/usr/X11R7/include -std=c99 -pedantic -Wall -Os
LDFLAGS = -Wl,-R/usr/X11R7/lib -L/usr/X11R7/lib -lxcb -lxcb-image

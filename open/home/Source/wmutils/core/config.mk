PREFIX = /usr/local
MANPREFIX = $(PREFIX)/man

CC      = cc
LD      = $(CC)

CFLAGS  = -std=c99 -pedantic -Wall -Os -I/usr/local/include -I/usr/X11R6/include
LDFLAGS = -lxcb -L/usr/local/lib -L /usr/X11R6/lib


PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

CC = cc
LD = $(CC)

CFLAGS  = -I/usr/X11R6/include -std=c99 -pedantic -Wall -Os
LDFLAGS = -L/usr/X11R6/lib -lxcb

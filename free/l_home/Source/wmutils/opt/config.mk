PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

CC = cc
LD = $(CC)

CFLAGS  = -I/usr/local/include -std=c99 -pedantic -Wall -Os
LDFLAGS = -L/usr/local/lib -lxcb

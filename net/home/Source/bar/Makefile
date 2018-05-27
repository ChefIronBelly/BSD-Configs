# This snippet has been shmelessly stol^Hborrowed from thestinger's repose Makefile
VERSION = 1.3

CC      = cc
LD      = $(CC)

CFLAGS += -I/usr/pkg/include -I/usr/X11R7/include -Wall -std=c99 -Os -DVERSION="\"$(VERSION)\""
LDFLAGS += -Wl,-R/usr/X11R7/lib -L/usr/X11R7/lib -lxcb -lxcb-xinerama -lxcb-randr
CFDEBUG = -g3 -pedantic -Wall -Wunused-parameter -Wlong-long \
          -Wsign-conversion -Wconversion -Wimplicit-function-declaration

EXEC = lemonbar
SRCS = lemonbar.c
OBJS = ${SRCS:.c=.o}

PREFIX?=/usr/pkg
BINDIR=${PREFIX}/bin
MANPREFIX = $(PREFIX)/man

all: ${EXEC}

doc: README.pod
	pod2man --section=1 --center="lemonbar Manual" --name "lemonbar" --release="lemonbar $(VERSION)" README.pod > lemonbar.1

.c.o:
	${CC} ${CFLAGS} -o $@ -c $<

${EXEC}: ${OBJS}
	${CC} -o ${EXEC} ${OBJS} ${LDFLAGS}

debug: ${EXEC}
debug: CC += ${CFDEBUG}

clean:
	rm -f ./*.o ./*.1
	rm -f ./${EXEC}

install: lemonbar doc
	install -D -m 755 lemonbar ${DESTDIR}${BINDIR}/lemonbar
	install -D -m 644 lemonbar.1 ${DESTDIR}${PREFIX}/share/man/man1/lemonbar.1

uninstall:
	rm -f ${DESTDIR}${BINDIR}/lemonbar
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/lemonbar.1

.PHONY: all debug clean install

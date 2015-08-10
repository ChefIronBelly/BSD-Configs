VERSION = 1.1

CC	?= gcc
CFLAGS += -Wall -std=c99 -Os -DVERSION="\"$(VERSION)\"" -I/usr/X11R7/include/freetype2
LDFLAGS += -I/usr/X11R7/lib -lxcb -lxcb-xinerama -lxcb-randr -lX11 -lX11-xcb -lXft -lfreetype -lz -lfontconfig
CFDEBUG = -g3 -pedantic -Wall -Wunused-parameter -Wlong-long \
          -Wsign-conversion -Wconversion -Wimplicit-function-declaration

EXEC = lemonbar
SRCS = lemonbar.c
OBJS = ${SRCS:.c=.o}

PREFIX=/usr/pkg
BINDIR=${PREFIX}/bin

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
#	install -D -m 755 lemonbar ${DESTDIR}${BINDIR}/lemonbar
#	install -D -m 644 lemonbar.1 ${DESTDIR}${PREFIX}/share/man/man1/lemonbar.1
	
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(EXEC) $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp -f $(EXEC).1 $(DESTDIR)$(PREFIX)/share/man/man1/lemonbar.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/lemonbar
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/lemonbar.1

.PHONY: all debug clean install

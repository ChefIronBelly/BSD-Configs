BINDIR = /usr/local/bin
NOMAN  = noman
PROG   = dwmstat

CFLAGS  += -std=c99 -pedantic -Werror
CFLAGS  += -Wno-error=variadic-macros
CFLAGS  += -I/usr/X11R6/include
LDFLAGS += -L/usr/X11R6/lib
LDADD    = -lX11
WARNINGS = Yes

${OBJS}: config.h

config.h:
	@cp config.def.h $@

.include <bsd.prog.mk>

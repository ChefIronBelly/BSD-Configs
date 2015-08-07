VERSION = 0.3

PREFIX = /usr/pkg
MANPREFIX = $(PREFIX)/man

CPPFLAGS = -I/usr/pkg/include
CFLAGS = -I/usr/pkg/include/libpng16 -Wall -O3 
LDFLAGS = -Wl,-R/usr/pkg/lib -L/usr/pkg/lib -lpng16
OBJ = colors.o png.o
BIN = colors

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $(OBJ) $(LDFLAGS)

colors.o: arg.h colors.h tree.h
png.o: colors.h

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f $(BIN).1 $(DESTDIR)$(MANPREFIX)/man1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(BIN)
	rm -f $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1

clean:
	rm -f $(BIN) $(OBJ)

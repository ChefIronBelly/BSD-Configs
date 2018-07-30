PREFIX	 = /usr/pkg

CC	?= cc
LD	 = ${CC}

CFLAGS	+= -Wall -I/usr/pkg/include -I/usr/X11R7/include
LDFLAGS	+= -R/usr/X11R7/lib -L/usr/X11R7/lib


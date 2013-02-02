# libbiscuit
# shane tully (shane@shanetully.com)
# shanetully.com

CC=gcc
LANG=c

PROJ_NAME = libbiscuit
VERSION = "\"1.0.0\""

SO = $(PROJ_NAME).so
ARCHIVE = $(PROJ_NAME).a

#INSTALL_DIR=/usr/sbin/

SOURCES = $(wildcard src/*.c)
OBJECTS = $(SOURCES:.$(LANG)=.o)

CFLAGS = -Wall -Wextra -fPIC -DVERSION=$(VERSION)

DEBUG ?= 1
ifeq ($(DEBUG), 1)
	CFLAGS += -ggdb -DDEBUG
else
	CFLAGS += -O2
endif

.PHONY = all install remove clean

all: $(OBJECTS)
	$(CC) -shared -o bin/$(SO) $^
	ar rcs bin/$(ARCHIVE) $(OBJECTS)

install:
	cp bin/$(BINARY) $(INSTALL_DIR)$(BINARY)

remove:
	rm $(INSTALL_DIR)$(BINARY)

.$(LANG).o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS)
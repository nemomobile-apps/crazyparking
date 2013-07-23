
TARGET = crazyparking
SOURCES = $(wildcard src/*.c)

SOUNDS = $(wildcard data/sounds/*)
PIXMAPS = $(wildcard data/pixmaps/*)
MAZES = $(wildcard data/mazes/*)

PKGS = sdl2 SDL2_mixer glesv1_cm

CFLAGS += $(shell pkg-config --cflags $(PKGS))
LIBS += $(shell pkg-config --libs $(PKGS))

DESTDIR ?=
DATADIR ?= /opt/$(TARGET)

CFLAGS += -DSOUNDPREFIX=\"$(DATADIR)/sounds\"
CFLAGS += -DGFXPREFIX=\"$(DATADIR)/pixmaps\"
CFLAGS += -DMAZEPREFIX=\"$(DATADIR)/mazes\"

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) -o $@ $^ $(LIBS) $(CFLAGS)

install: $(TARGET)
	install -d $(DESTDIR)/opt/$(TARGET)
	install -m755 $(TARGET) $(DESTDIR)/opt/$(TARGET)
	install -d $(DESTDIR)$(DATADIR)/sounds
	install -m644 $(SOUNDS) $(DESTDIR)$(DATADIR)/sounds
	install -d $(DESTDIR)$(DATADIR)/pixmaps
	install -m644 $(PIXMAPS) $(DESTDIR)$(DATADIR)/pixmaps
	install -d $(DESTDIR)$(DATADIR)/mazes
	install -m644 $(MAZES) $(DESTDIR)$(DATADIR)/mazes
	install -d $(DESTDIR)/usr/share/applications
	install -m644 $(TARGET).desktop $(DESTDIR)/usr/share/applications

clean:
	rm -f $(TARGET)

.PHONY: all clean


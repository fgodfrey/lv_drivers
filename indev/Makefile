TOPDIR?=../../..
include $(TOPDIR)/build-support/globals.mk

SUBDIRS=
PROGS=
OBJS += FT5406EE8.o
OBJS += keyboard.o
OBJS += mouse.o
OBJS += evdev.o
OBJS += XPT2046.o
INSTDIR=$(INSTALLROOT)/include/lv_drivers/indev
CFLAGS+=-I$(INSTALLROOT)/include/lvgl

all: headers build install

build: $(OBJS)

install:
	install -m 755 -d $(INSTALLROOT)/lib
	install -m 555 libvgl.a $(INSTALLROOT)/lib

headers:
	$(INSTALL) -d -m 755 $(INSTDIR)
	for file in *.h ; do 				\
		$(INSTALL) -m 444 $$file $(INSTDIR) ;	\
	done

clean:
	rm -f $(PROGS) *.o

include $(TOPDIR)/build-support/base-rules.mk

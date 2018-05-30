TOPDIR?=../../..
include $(TOPDIR)/build-support/globals.mk

SUBDIRS=
PROGS=
OBJS += fbdev.o
OBJS += monitor.o
OBJS += R61581.o
OBJS += SSD1963.o
OBJS += ST7565.o
INSTDIR=$(INSTALLROOT)/include/lv_drivers/display

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

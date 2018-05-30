TOPDIR?=../..
include $(TOPDIR)/build-support/globals.mk

SUBDIRS=display indev
PROGS=libvdrivers.a
INSTDIR=$(INSTALLROOT)/include/lvgl

all: headers build install

.PHONY: build
build: $(PROGS)

install:
	install -m 755 -d $(INSTALLROOT)/lib
	install -m 555 libvdrivers.a $(INSTALLROOT)/lib

headers:
	for DIR in $(SUBDIRS) ; do                              \
		$(MAKE) -C $$DIR headers TOPDIR=$(TOPDIR)/.. ;  \
	done

	$(INSTALL) -d -m 755 $(INSTDIR)

	for file in *.h ; do 				\
		$(INSTALL) -m 444 $$file $(INSTDIR) ;	\
	done

clean:
	for DIR in $(SUBDIRS) ; do	 			\
		$(MAKE) -C $$DIR clean TOPDIR=$(TOPDIR)/.. ;	\
	done
	rm -f $(PROGS) *.o

libvdrivers.a:
	for DIR in $(SUBDIRS) ; do                      \
		$(MAKE) -C $$DIR build TOPDIR=$(TOPDIR)/.. ;            \
	done
	$(AR) $(AROPTS) $@ */*.o
	$(RANLIB) $@

include $(TOPDIR)/build-support/base-rules.mk

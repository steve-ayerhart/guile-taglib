all-local: config.scm

lib_builddir = $(shell cd $(top_builddir)/guile-taglib && pwd)

moduledir = $(prefix)/share/guile/site/2.0/taglib

module_DATA = config.scm base.scm

BUILT_SOURCES = $(module_DATA) 

config.scm: Makefile config.scm.in
	sed -e "s|@taglibpath\@|$(lib_builddir)/libguile-taglib|"\
		$(srcdir)/config.scm.in > config.scm

install-data-local: Makefile config.scm.in
	sed -e "s|@taglibpath\@|$(extlibdir)/libguile-taglib|" \
		$(srcdir)/config.scm.in > $(DESTDIR)$(moduledir)/config.scm
	chmod 644 $(DESTDIR)$(moduledir)/config.scm

uninstall-local:
	rm -f $(DESTDIR)$(moduledir)/*.scm

extlibdir = $(libdir)/guile/2.0/extensions

CLEANFILES = config.scm $(module_DATA)

EXTRA_DIST = config.scm.in $(module_DATA)

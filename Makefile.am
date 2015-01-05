SUBDIRS = guile-taglib taglib tests doc
ACLOCAL_AMFLAGS = -I m4

env: Makefile env.in
	sed -e "s|@top_srcdir\@|$(shell cd $(top_srcdir) && pwd)|" \
		$(srcdir)/env.in > env
	chmod +x env

BUILT_SOURCES = env
CLEANFILES = env

scmdir=$(prefix)/share/guile/site/2.0

scm_DATA =

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = guile-taglib.pc

EXTRA_DIST = autogen.sh env.in HACKING $(scm_DATA)

extlibdir = $(libdir)/guile/2.0/extensions

extlib_LTLIBRARIES = libguile-taglib.la

AM_CFLAGS = -I$(srcdir) $(WARN_CFLAGS) $(DEBUG_CFLAGS)

BUILT_SOURCES = \
  base.cxx      \
  flac.cxx 


CLEANFILES = $(BUILT_SOURCES)

libguile_taglib_la_SOURCES = $(BUILT_SOURCES) helpers.cxx
libguile_taglib_la_LDFLAGS = -export-dynamic -module -avoid-version
libguile_taglib_la_CPPFLAGS = $(AM_CFLAGS) $(TAGLIB_CFLAGS) $(GUILE_CFLAGS)
libguile_taglib_la_LIBADD = $(TAGLIB_LIBS) $(GUILE_LIBS)

base.cxx: base/base.i
	$(SWIG) -I/usr/local/include -guile -Linkage passive -package taglib -outdir $(top_srcdir) -scmstub -o $@ $<

flac.cxx: flac/flac.i
	$(SWIG) -I/usr/local/include -guile -Linkage passive -package taglib  -outdir $(top_srcdir) -scmstub -o $@ $<

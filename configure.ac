AC_PREREQ(2.65)
AC_INIT(guile-taglib, 1.3.0, [steve@erhart.io])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR(build-aux)

LT_INIT

AC_CONFIG_HEADER(config.h)

AM_INIT_AUTOMAKE([color-tests silent-rules])

AC_PROG_CXX
AC_DISABLE_STATIC
AC_PROG_LIBTOOL

PKG_CHECK_MODULES(GUILE, [guile-2.0 >= 2.0.0])
PKG_CHECK_MODULES(TAGLIB,[taglib >=  1.6])

AX_PKG_SWIG(1.3.17, [], [ AC_MSG_ERROR([SWIG >= 1.3.17 is required to build]) ])
AX_SWIG_ENABLE_CXX

WARN_CFLAGS=-Wall
AC_ARG_ENABLE([Werror], AC_HELP_STRING([--disable-Werror],[Don't stop the build on errors]),
        [], WARN_CFLAGS="-Wall -Werror")
AC_SUBST(WARN_CFLAGS)


AC_CONFIG_FILES(
Makefile
guile-taglib.pc
taglib/Makefile
guile-taglib/Makefile
tests/Makefile
doc/Makefile
)

AC_OUTPUT

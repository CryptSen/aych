dnl Copyright (c) 2015 - 2020 Jean Wallet
dnl Copyright (c) 2015 - 2020 The AYCHDeveloper
dnl Distributed under the MIT software license, the AGPL-3.0 or later, see the accompanying
dnl file LICENSE or http://www.opensource.org/licenses/mit-license.php.
dnl file LICENSE or https://www.gnu.org/licenses.

dnl AYCH_SUBDIR_TO_INCLUDE([CPPFLAGS-VARIABLE-NAME],[SUBDIRECTORY-NAME],[HEADER-FILE])
dnl SUBDIRECTORY-NAME must end with a path separator
AC_DEFUN([AYCH_SUBDIR_TO_INCLUDE],[
  if test "x$2" = "x"; then
    AC_MSG_RESULT([default])
  else
    echo "#include <$2$3.h>" >conftest.cpp
    newinclpath=`${CXXCPP} ${CPPFLAGS} -M conftest.cpp 2>/dev/null | [ tr -d '\\n\\r\\\\' | sed -e 's/^.*[[:space:]:]\(\/[^[:space:]]*\)]$3[\.h[[:space:]].*$/\1/' -e t -e d`]
    AC_MSG_RESULT([${newinclpath}])
    if test "x${newinclpath}" != "x"; then
      eval "$1=\"\$$1\"' -I${newinclpath}'"
    fi
  fi
])

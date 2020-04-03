dnl Copyright (c) 2015 - 2020 Jean Wallet
dnl Copyright (c) 2015 - 2020 The AYCHDeveloper
dnl Distributed under the MIT software license, the AGPL-3.0 or later, see the accompanying
dnl file LICENSE or http://www.opensource.org/licenses/mit-license.php.
dnl file LICENSE or https://www.gnu.org/licenses.
$
# Some versions of gcc/libstdc++ require linking with -latomic if
# using the C++ atomic library.
#
# Sourced from http://bugs.debian.org/797228

m4_define([_CHECK_ATOMIC_testbody], [[
  #include <atomic>
  #include <cstdint>

  int main() {
    std::atomic<int64_t> a{};

    int64_t v = 5;
    int64_t r = a.fetch_add(v);
    return static_cast<int>(r);
  }
]])

AC_DEFUN([CHECK_ATOMIC], [

  AC_LANG_PUSH(C++)

  AC_MSG_CHECKING([whether std::atomic can be used without link library])

  AC_LINK_IFELSE([AC_LANG_SOURCE([_CHECK_ATOMIC_testbody])],[
      AC_MSG_RESULT([yes])
    ],[
      AC_MSG_RESULT([no])
      LIBS="$LIBS -latomic"
      AC_MSG_CHECKING([whether std::atomic needs -latomic])
      AC_LINK_IFELSE([AC_LANG_SOURCE([_CHECK_ATOMIC_testbody])],[
          AC_MSG_RESULT([yes])
        ],[
          AC_MSG_RESULT([no])
          AC_MSG_FAILURE([cannot figure out how to use std::atomic])
        ])
    ])

  AC_LANG_POP
])

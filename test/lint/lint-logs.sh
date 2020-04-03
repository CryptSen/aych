#!/usr/bin/env bash
#
# Copyright (c) 2015 - 2020 Jean Wallet
# Copyright (c) 2015 - 2020 The AYCHDeveloper
# Distributed under the MIT software license, the AGPL-3.0 or later, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.
#
# Check that all logs are terminated with '\n'
#
# Some logs are continued over multiple lines. They should be explicitly
# commented with \* Continued *\
#
# There are some instances of LogPrintf() in comments. Those can be
# ignored

export LC_ALL=C
UNTERMINATED_LOGS=$(git grep --extended-regexp "LogPrintf?\(" -- "*.cpp" | \
    grep -v '\\n"' | \
    grep -v "/\* Continued \*/" | \
    grep -v "LogPrint()" | \
    grep -v "LogPrintf()")
if [[ ${UNTERMINATED_LOGS} != "" ]]; then
    echo "All calls to LogPrintf() and LogPrint() should be terminated with \\n"
    echo
    echo "${UNTERMINATED_LOGS}"
    exit 1
fi

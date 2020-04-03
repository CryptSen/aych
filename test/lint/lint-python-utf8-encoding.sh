#!/usr/bin/env bash
#
# Copyright (c) 2015 - 2020 Jean Wallet
# Copyright (c) 2015 - 2020 The AYCHDeveloper
# Distributed under the MIT software license, the AGPL-3.0 or later, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.
#
# Make sure we explicitly open all text files using UTF-8 (or ASCII) encoding to
# avoid potential issues on the BSDs where the locale is not always set.

export LC_ALL=C
EXIT_CODE=0
OUTPUT=$(git grep " open(" -- "*.py" | grep -vE "encoding=.(ascii|utf8|utf-8)." | grep -vE "open\([^,]*, ['\"][^'\"]*b[^'\"]*['\"]")
if [[ ${OUTPUT} != "" ]]; then
    echo "Python's open(...) seems to be used to open text files without explicitly"
    echo "specifying encoding=\"utf8\":"
    echo
    echo "${OUTPUT}"
    EXIT_CODE=1
fi
exit ${EXIT_CODE}

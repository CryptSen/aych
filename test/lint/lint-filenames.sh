#!/usr/bin/env bash
#
# Copyright (c) 2015 - 2020 Jean Wallet
# Copyright (c) 2015 - 2020 The AYCHDeveloper.
# Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.
#
# Make sure only lowercase alphanumerics (a-z0-9), underscores (_),
# hyphens (-) and dots (.) are used in source code filenames.

export LC_ALL=C

EXIT_CODE=0
OUTPUT=$(git ls-files --full-name -- "*.[cC][pP][pP]" "*.[hH]" "*.[pP][yY]" "*.[sS][hH]" | \
    grep -vE '^[a-z0-9_./-]+$' | \
    grep -vE '^src/(secp256k1|univalue)/')

if [[ ${OUTPUT} != "" ]]; then
    echo "Use only lowercase alphanumerics (a-z0-9), underscores (_), hyphens (-) and dots (.)"
    echo "in source code filenames:"
    echo
    echo "${OUTPUT}"
    EXIT_CODE=1
fi
exit ${EXIT_CODE}

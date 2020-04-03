#!/usr/bin/env bash
#
# Copyright (c) 2015 - 2020 Jean Wallet
# Copyright (c) 2015 - 2020 The AYCHDeveloper
# Distributed under the MIT software license, the AGPL-3.0 or later, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.
#
# Make sure all shell scripts:
# a.) explicitly opt out of locale dependence using "export LC_ALL=C", or
# b.) explicitly opt in to locale dependence using the annotation below.

export LC_ALL=C

EXIT_CODE=0
for SHELL_SCRIPT in $(git ls-files -- "*.sh" | grep -vE "src/(secp256k1|univalue)/"); do
    if grep -q "# This script is intentionally locale dependent by not setting \"export LC_ALL=C\"" "${SHELL_SCRIPT}"; then
        continue
    fi
    FIRST_NON_COMMENT_LINE=$(grep -vE '^(#.*|)$' "${SHELL_SCRIPT}" | head -1)
    if [[ ${FIRST_NON_COMMENT_LINE} != "export LC_ALL=C" ]]; then
        echo "Missing \"export LC_ALL=C\" (to avoid locale dependence) as first non-comment non-empty line in ${SHELL_SCRIPT}"
        EXIT_CODE=1
    fi
done
exit ${EXIT_CODE}

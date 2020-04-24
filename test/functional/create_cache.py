#!/usr/bin/env python3
# Copyright (c) 2015 - 2020 The AYCHDeveloper.
# Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.

"""Create a blockchain cache.

Creating a cache of the blockchain speeds up test execution when running
multiple functional tests. This helper script is executed by test_runner when multiple
tests are being run in parallel.
"""

from test_framework.test_framework import AychTestFramework

class CreateCache(AychTestFramework):
    # Test network and test nodes are not required:

    def set_test_params(self):
        self.num_nodes = 0
        self.supports_cli = True

    def setup_network(self):
        pass

    def run_test(self):
        pass

if __name__ == '__main__':
    CreateCache().main()

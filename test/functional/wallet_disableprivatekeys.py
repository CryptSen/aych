#!/usr/bin/env python3
# Copyright (c) 2015 - 2020 The AYCHDeveloper.
# Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.

"""Test disable-privatekeys mode.
"""

from test_framework.test_framework import AychTestFramework
from test_framework.util import (
    assert_raises_rpc_error,
)


class DisablePrivateKeysTest(AychTestFramework):
    def set_test_params(self):
        self.setup_clean_chain = False
        self.num_nodes = 1
        self.supports_cli = True

    def skip_test_if_missing_module(self):
        self.skip_if_no_wallet()

    def run_test(self):
        node = self.nodes[0]
        self.log.info("Test disableprivatekeys creation.")
        self.nodes[0].createwallet('w1', True)
        self.nodes[0].createwallet('w2')
        w1 = node.get_wallet_rpc('w1')
        w2 = node.get_wallet_rpc('w2')
        assert_raises_rpc_error(-4,"Error: Private keys are disabled for this wallet", w1.getnewaddress)
        assert_raises_rpc_error(-4,"Error: Private keys are disabled for this wallet", w1.getrawchangeaddress)
        w1.importpubkey(w2.getaddressinfo(w2.getnewaddress())['pubkey'])

if __name__ == '__main__':
    DisablePrivateKeysTest().main()

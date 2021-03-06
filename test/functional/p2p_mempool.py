#!/usr/bin/env python3
# Copyright (c) 2015 - 2020 The AYCHDeveloper.
# Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.

"""Test p2p mempool message.

Test that nodes are disconnected if they send mempool messages when bloom
filters are not enabled.
"""

from test_framework.messages import msg_mempool
from test_framework.mininode import P2PInterface
from test_framework.test_framework import AychTestFramework
from test_framework.util import assert_equal

class P2PMempoolTests(AychTestFramework):
    def set_test_params(self):
        self.setup_clean_chain = True
        self.num_nodes = 1
        self.extra_args = [["-peerbloomfilters=0"]]

    def run_test(self):
        # Add a p2p connection
        self.nodes[0].add_p2p_connection(P2PInterface())

        #request mempool
        self.nodes[0].p2p.send_message(msg_mempool())
        self.nodes[0].p2p.wait_for_disconnect()

        #mininode must be disconnected at this point
        assert_equal(len(self.nodes[0].getpeerinfo()), 0)

if __name__ == '__main__':
    P2PMempoolTests().main()

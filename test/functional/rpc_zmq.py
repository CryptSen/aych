#!/usr/bin/env python3
# Copyright (c) 2015 - 2020 The AYCHDeveloper.
# Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.

"""Test for the ZMQ RPC methods."""

from test_framework.test_framework import AychTestFramework
from test_framework.util import assert_equal


class RPCZMQTest(AychTestFramework):

    address = "tcp://127.0.0.1:28332"

    def set_test_params(self):
        self.num_nodes = 1
        self.setup_clean_chain = True

    def skip_test_if_missing_module(self):
        self.skip_if_no_py3_zmq()
        self.skip_if_no_bitcoind_zmq()

    def run_test(self):
        self._test_getzmqnotifications()

    def _test_getzmqnotifications(self):
        self.restart_node(0, extra_args=[])
        assert_equal(self.nodes[0].getzmqnotifications(), [])

        self.restart_node(0, extra_args=["-zmqpubhashtx=%s" % self.address])
        assert_equal(self.nodes[0].getzmqnotifications(), [
            {"type": "pubhashtx", "address": self.address},
        ])


if __name__ == '__main__':
    RPCZMQTest().main()

#!/usr/bin/env python3
# Copyright (c) 2015 - 2020 The AYCHDeveloper.
# Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
# file LICENSE or http://www.opensource.org/licenses/mit-license.php.
# file LICENSE or https://www.gnu.org/licenses.

"""Test using named arguments for RPCs."""

from test_framework.test_framework import AychTestFramework
from test_framework.util import (
    assert_equal,
    assert_raises_rpc_error,
)

class NamedArgumentTest(AychTestFramework):
    def set_test_params(self):
        self.num_nodes = 1

    def run_test(self):
        node = self.nodes[0]
        h = node.help(command='getblockchaininfo')
        assert(h.startswith('getblockchaininfo\n'))

        assert_raises_rpc_error(-8, 'Unknown named parameter', node.help, random='getblockchaininfo')

        h = node.getblockhash(height=0)
        node.getblock(blockhash=h)

        assert_equal(node.echo(), [])
        assert_equal(node.echo(arg0=0,arg9=9), [0] + [None]*8 + [9])
        assert_equal(node.echo(arg1=1), [None, 1])
        assert_equal(node.echo(arg9=None), [None]*10)
        assert_equal(node.echo(arg0=0,arg3=3,arg9=9), [0] + [None]*2 + [3] + [None]*5 + [9])

if __name__ == '__main__':
    NamedArgumentTest().main()

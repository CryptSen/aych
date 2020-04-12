// Copyright (c) 2015 - 2020 Jean Wallet
// Copyright (c) 2015 - 2020 The AYCHDeveloper.
// Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.
// file LICENSE or https://www.gnu.org/licenses.

#ifndef AYCH_RPC_UTIL_H
#define AYCH_RPC_UTIL_H

#include <pubkey.h>
#include <script/standard.h>
#include <univalue.h>

#include <boost/variant/static_visitor.hpp>

#include <string>
#include <vector>

class CKeyStore;
class CPubKey;
class CScript;

CPubKey HexToPubKey(const std::string& hex_in);
CPubKey AddrToPubKey(CKeyStore* const keystore, const std::string& addr_in);
CScript CreateMultisigRedeemscript(const int required, const std::vector<CPubKey>& pubkeys);

UniValue DescribeAddress(const CTxDestination& dest);

#endif // AYCH_RPC_UTIL_H

// Copyright (c) 2015 - 2020 Jean Wallet
// Copyright (c) 2015 - 2020 The AYCHDeveloper
// Distributed under the MIT software license, the AGPL-3.0+, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.
// file LICENSE or https://www.gnu.org/licenses.

#ifndef AYCH_POLICY_RBF_H
#define AYCH_POLICY_RBF_H

#include <txmempool.h>

static const uint32_t MAX_BIP125_RBF_SEQUENCE = 0xfffffffd;

enum class RBFTransactionState {
    UNKNOWN,
    REPLACEABLE_BIP125,
    FINAL
};

// Check whether the sequence numbers on this transaction are signaling
// opt-in to replace-by-fee, according to BIP 125
bool SignalsOptInRBF(const CTransaction &tx);

// Determine whether an in-mempool transaction is signaling opt-in to RBF
// according to BIP 125
// This involves checking sequence numbers of the transaction, as well
// as the sequence numbers of all in-mempool ancestors.
RBFTransactionState IsRBFOptIn(const CTransaction &tx, CTxMemPool &pool) EXCLUSIVE_LOCKS_REQUIRED(pool.cs);

#endif // AYCH_POLICY_RBF_H

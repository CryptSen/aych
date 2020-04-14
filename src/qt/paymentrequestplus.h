// Copyright (c) 2015 - 2020 Jean Wallet
// Copyright (c) 2015 - 2020 The AYCHDeveloper.
// Distributed under the MIT software license, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.
// file LICENSE or https://www.gnu.org/licenses.

#ifndef AYCH_QT_PAYMENTREQUESTPLUS_H
#define AYCH_QT_PAYMENTREQUESTPLUS_H

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#include <qt/paymentrequest.pb.h>
#pragma GCC diagnostic pop

#include <amount.h>
#include <script/script.h>

#include <openssl/x509.h>

#include <QByteArray>
#include <QList>
#include <QString>

static const bool DEFAULT_SELFSIGNED_ROOTCERTS = false;

//
// Wraps dumb protocol buffer paymentRequest
// with extra methods
//

class PaymentRequestPlus
{
public:
    PaymentRequestPlus() { }

    bool parse(const QByteArray& data);
    bool SerializeToString(std::string* output) const;

    bool IsInitialized() const;
    // Returns true if merchant's identity is authenticated, and
    // returns human-readable merchant identity in merchant
    bool getMerchant(X509_STORE* certStore, QString& merchant) const;

    // Returns list of outputs, amount
    QList<std::pair<CScript,CAmount> > getPayTo() const;

    const payments::PaymentDetails& getDetails() const { return details; }

private:
    payments::PaymentRequest paymentRequest;
    payments::PaymentDetails details;
};

#endif // AYCH_QT_PAYMENTREQUESTPLUS_H

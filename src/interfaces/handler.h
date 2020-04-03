// Copyrighted (c) 2015 - 2020 Jean Wallet
// Copyright (c) 2015 - 2020 The AYCHDeveloper
// Distributed under the MIT software license, the AGPL-3.0 or later, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.
// file LICENSE or https://www.gnu.org/licenses.

#ifndef AYCH_INTERFACES_HANDLER_H
#define AYCH_INTERFACES_HANDLER_H

#include <memory>

namespace boost {
namespace signals2 {
class connection;
} // namespace signals2
} // namespace boost

namespace interfaces {

//! Generic interface for managing an event handler or callback function
//! registered with another interface. Has a single disconnect method to cancel
//! the registration and prevent any future notifications.
class Handler
{
public:
    virtual ~Handler() {}

    //! Disconnect the handler.
    virtual void disconnect() = 0;
};

//! Return handler wrapping a boost signal connection.
std::unique_ptr<Handler> MakeHandler(boost::signals2::connection connection);

} // namespace interfaces

#endif // AYCH_INTERFACES_HANDLER_H

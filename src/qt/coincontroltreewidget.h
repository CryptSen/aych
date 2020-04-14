// Copyright (c) 2015 - 2020 Jean Wallet
// Copyright (c) 2015 - 2020 The AYCHDeveloper.
// Distributed under the MIT software license, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.
// file LICENSE or https://www.gnu.org/licenses.

#ifndef AYCH_QT_COINCONTROLTREEWIDGET_H
#define AYCH_QT_COINCONTROLTREEWIDGET_H

#include <QKeyEvent>
#include <QTreeWidget>

class CoinControlTreeWidget : public QTreeWidget
{
    Q_OBJECT

public:
    explicit CoinControlTreeWidget(QWidget *parent = 0);

protected:
    virtual void keyPressEvent(QKeyEvent *event);
};

#endif // AYCH_QT_COINCONTROLTREEWIDGET_H

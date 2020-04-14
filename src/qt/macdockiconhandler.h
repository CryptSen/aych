// Copyright (c) 2015 - 2020 Jean Wallet
// Copyright (c) 2015 - 2020 The AYCHDeveloper.
// Distributed under the MIT software license, see the accompanying
// file LICENSE or http://www.opensource.org/licenses/mit-license.php.
// file LICENSE or https://www.gnu.org/licenses.

#ifndef AYCH_QT_MACDOCKICONHANDLER_H
#define AYCH_QT_MACDOCKICONHANDLER_H

#include <QMainWindow>
#include <QObject>

QT_BEGIN_NAMESPACE
class QIcon;
class QMenu;
class QWidget;
QT_END_NAMESPACE

/** Macintosh-specific dock icon handler.
 */
class MacDockIconHandler : public QObject
{
    Q_OBJECT

public:
    ~MacDockIconHandler();

    QMenu *dockMenu();
    void setIcon(const QIcon &icon);
    void setMainWindow(QMainWindow *window);
    static MacDockIconHandler *instance();
    static void cleanup();
    void handleDockIconClickEvent();

Q_SIGNALS:
    void dockIconClicked();

private:
    MacDockIconHandler();

    QWidget *m_dummyWidget;
    QMenu *m_dockMenu;
    QMainWindow *mainWindow;
};

#endif // AYCH_QT_MACDOCKICONHANDLER_H

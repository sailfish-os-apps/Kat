#ifndef VKSDK_H
#define VKSDK_H

#include <QList>
#include <QObject>
#include <QString>
#include <QStringList>

#include "longpoll.h"
#include "messages.h"
#include "users.h"
#include "objects/chat.h"
#include "objects/dialog.h"
#include "objects/user.h"

class VkSDK : public QObject
{
    Q_OBJECT

    Q_PROPERTY(User* selfProfile READ selfProfile CONSTANT)

    Q_PROPERTY(LongPoll* longPoll READ longPoll CONSTANT)
    Q_PROPERTY(Messages* messages READ messages CONSTANT)
    Q_PROPERTY(Users* users READ users CONSTANT)

public:
    explicit VkSDK(QObject *parent = 0);
    ~VkSDK();

    Q_INVOKABLE void setAccessTocken(QString value);
    Q_INVOKABLE void setUserId(int value);

    User* selfProfile() const;

    LongPoll* longPoll() const;
    Messages* messages() const;
    Users* users() const;

signals:
    void gotSelfProfile();
    void gotProfile(User *user);

public slots:
    void gotUserProfile(User *user);

    void gotChatsList(QList<QObject*> chatsList);
    void gotDialogList(QList<QObject*> dialogsList);
    void gotUsersList(QList<QObject*> usersList);

private:
    QString _accessToken;
    int _userId;

    User *_selfProfile;

    LongPoll *_longPoll;
    Messages *_messages;
    Users *_users;

    QStringList _usersIds;
    QStringList _chatsIds;
    QList<QObject*> _dialogs;
};

#endif // VKSDK_H

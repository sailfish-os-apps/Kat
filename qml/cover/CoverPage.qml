/*
  Copyright (C) 2016 Petr Vytovtov
  Contact: Petr Vytovtov <osanwe@protonmail.ch>
  All rights reserved.

  This file is part of Kat.

  Kat is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Kat is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Kat.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: cover

    BackgroundItem {
        id: background
        anchors.fill: parent
        Image {
            id: bg_image
            anchors.fill: parent
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectCrop
            source: "/usr/share/icons/hicolor/86x86/apps/harbour-kat.png"
            opacity: 0.2
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: Theme.paddingMedium

        Row {
            spacing: Theme.paddingMedium

            Image {
                anchors.verticalCenter: messagesCounter.verticalCenter
                source: "image://theme/icon-m-message"
            }

            Label {
                id: messagesCounter
                text: "0"
                font.bold: true
                font.pixelSize: Theme.fontSizeHuge
            }
        }
    }

//    CoverActionList {
//        id: coverAction

//        CoverAction {
//            iconSource: "image://theme/icon-cover-new"
//        }
//    }

    Connections {
        target: vksdk
        onGotUnreadCounter: {
            console.log("onGotUnreadCounter", value)
            messagesCounter.text = value
        }
    }

    Connections {
        target: vksdk.longPoll
        onUnreadDialogsCounterUpdated: {
            console.log("onUnreadDialogsCounterUpdated", value)
            messagesCounter.text = value
        }
    }
}



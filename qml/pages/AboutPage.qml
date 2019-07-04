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


Page {
    id: aboutPage

    SilicaFlickable {
        anchors.fill: parent
        anchors.bottomMargin: Theme.paddingLarge
        contentHeight: header.height + content.height

        PageHeader {
            id: header
            title: qsTr("About") + " Kat"
        }

        Column {
            id: content
            anchors.top: header.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 2 * Theme.horizontalPageMargin
            spacing: Theme.paddingLarge

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.iconSizeExtraLarge
                height: Theme.iconSizeExtraLarge
                source: "/usr/share/icons/hicolor/86x86/apps/harbour-kat.png"
            }

            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: "v0.5.3"
            }

            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: "© 2015-2017 Petr Vytovtov"
            }

            Label {
                width: parent.width
                wrapMode: Text.WordWrap
                text: qsTr("The unofficial client for vk.com, distributed under the terms of the GNU GPLv3.")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.buttonWidthMedium
                text: qsTr("Homepage")
                onClicked: Qt.openUrlExternally("https://vk.com/kat_sailfishos")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.buttonWidthMedium
                text: qsTr("Donate")
                onClicked: Qt.openUrlExternally("https://money.yandex.ru/to/410013326290845")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.buttonWidthMedium
                text: qsTr("Source code")
                onClicked: Qt.openUrlExternally("https://github.com/osanwe/Kat")
            }

            Label {
                width: parent.width
                wrapMode: Text.WordWrap
                linkColor: Theme.highlightColor
                onLinkActivated: Qt.openUrlExternally(link)
                text: qsTr("Thanks for features") + ":<br>" +
                      "<a href=\"https://github.com/sash13\">Alexander Ryzhkov</a>"
            }

            Label {
                width: parent.width
                wrapMode: Text.WordWrap
                linkColor: Theme.highlightColor
                onLinkActivated: Qt.openUrlExternally(link)
                text: qsTr("Localization") + ":<br>" +
                      qsTr("Italian") + ": <a href=\"https://github.com/fravaccaro\">Fra</a><br>" +
                      qsTr("Dutch") + ": <a href=\"https://github.com/richdb\">Richard</a><br>"
            }
        }

        VerticalScrollDecorator {}
    }

//    onStatusChanged: if (status === PageStatus.Active) pageStack.pushAttached(Qt.resolvedUrl("AudioPlayerPage.qml"))
}

/*******************************************************************/

/* Original File Name: AppBar.qml                                  */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация AppBar.                                 */

/*******************************************************************/

import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Rectangle {
    id: appBar
    anchors.top: titleBar.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 56

    function isMaximize() {
        return mainWindow.visibility === ApplicationWindow.Maximized
    }

    Rectangle {
        id: appBarRect
        anchors.fill: parent
        color: "#e91e63"

        Text {
            id: headerText
            text: qsTr("Counter")
            font.family: "Roboto Medium"
            font.pointSize: 15
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.margins: 19
        }
    }

    MouseArea {
        anchors.fill: parent

        onDoubleClicked: {
            isMaximize() ? mainWindow.showNormal() : mainWindow.showMaximized()
        }

        onPressed: {
            previousX = mouseX
            previousY = mouseY
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setX(mainWindow.x + dx)
        }

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setY(mainWindow.y + dy)
        }
    }
}

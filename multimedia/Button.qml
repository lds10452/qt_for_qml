import QtQuick 2.0

Rectangle {
    id: container

    property alias text: caption.text

    signal clicked

    radius: 8
    color: mouseArea.pressed?"black":"darkGray"
    border.color: "white"
    border.width: 2

    Text {
        id: caption
        anchors.centerIn: parent
        font.pixelSize: 25
        color: "white"
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onClicked: container.clicked();
    }
}

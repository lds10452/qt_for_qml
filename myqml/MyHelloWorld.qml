import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    property alias mArea: mousearea
    Text {
       text: "hello World"
       anchors.centerIn: parent
    }
    MouseArea
    {
        id:mousearea
        anchors.fill: parent
    }
}

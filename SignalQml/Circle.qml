import QtQuick 2.0

Item {
    width: 200
    height: 200
    property alias circleColor: circle.color
    property alias contentText: content.text

    Rectangle {
        id: circle
        color: "#e73d3d"
        radius: width*0.5
        anchors.fill: parent

        Text {
            id: content
            x: 88
            y: 78
            color: "#f9f8f8"
            text: qsTr("Text")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Courier"
            renderType: Text.NativeRendering
            font.pixelSize: 30
        }
    }

}

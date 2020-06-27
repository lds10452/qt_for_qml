import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
Window {
    objectName: "rootRect";
    width: 360;
    height: 360;
    visible: true
    title:qsTr("获得qml属性")
    Text {
        objectName: "textLabel";
        text: "Hello World";
        anchors.centerIn: parent;
        font.pixelSize: 26;
    }

    Button {
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        text: "quit";
        objectName: "quitButton";
    }
}


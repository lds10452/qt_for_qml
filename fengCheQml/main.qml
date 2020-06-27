import QtQuick 2.9
import QtQuick.Window 2.2

Window
{
    visible: true
    width: 480
    height: 360
    title: qsTr("Hello World")
    Image {
        id: root
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        source: "qrc:/images/background.png"
        MouseArea
        {
            anchors.fill: parent
            onClicked: pinwheel.rotation+=90
        }
        Image {
            id: pole
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            source: "qrc:/images/pole.png"
        }
        Image {
            id: pinwheel
            source: "qrc:/images/rocket1.png"
            anchors.centerIn: parent
            Behavior on rotation {
                NumberAnimation {
                    duration: 250
                }
            }
        }
    }
}



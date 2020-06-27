import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Background {
        id: background
        anchors.fill: parent
        target: sender
        Receiver {
            id: receiver
            x: 394
            y: 129
            width: sender.width
            circleColor: "#ff0000"
            contentText: "Recevier"
        }

        Sender {
            id: sender
            target:receiver
            x: 61
            y: 129
            circleColor: "#0000ff"
            contentText: "Sender"
        }
    }
}

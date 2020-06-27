import QtQuick 2.0
import QtQuick.Window 2.0
Window
{
    id:column
    visible: true
    width: 100
    height: 220
    Column
    {
        spacing: 2
        Repeater
        {
            model: ["a","b","c","d"]
            Rectangle
            {
                width: 100
                height: 20
                radius: 3
                color: "yellow"
                border.color: Qt.lighter("blue")
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: modelData+":"+ index
                }
            }
        }
    }
}

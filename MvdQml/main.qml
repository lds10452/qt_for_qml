import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    visible: true
    width: 640
    height: 120
    title: qsTr("Hello World")
    Row
    {
        spacing: 3
        Repeater
        {
            model: ListModel
            {
                ListElement{name:"a";surfaceColor:"gray"}
                ListElement{name:"b";surfaceColor:"yellow"}
                ListElement{name:"c";surfaceColor:"blue"}
                ListElement{name:"d";surfaceColor:"orange"}
                ListElement{name:"a";surfaceColor:"black"}
                ListElement{name:"b";surfaceColor:"green"}
                ListElement{name:"c";surfaceColor:"red"}
                ListElement{name:"d";surfaceColor:"white"}
            }
            Rectangle
            {
                width: 100
                height: 40
                color: "green"
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: name+":"+index
                }
                Rectangle
                {
                    anchors.leftMargin: 12
                    anchors.margins: 10
                    anchors.left: parent.left
                    width: 30
                    height: width
                    radius: 10
                    color: surfaceColor
                    border.color: Qt.lighter(color)
                }
            }
        }
    }
}

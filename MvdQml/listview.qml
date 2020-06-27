import QtQuick 2.0
import QtQuick.Window 2.0
//import QtQuick.Controls 2.0
Window
{
    visible: true
    width: 80
    height: 300
    title: qsTr("listview")
    ListView
    {
        id: view
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 100

        delegate: numberDelegate
        spacing: 5

        highlight: highlightComponent
        focus: true
        header: headerComponent
        footer: footerComponent
    }
    Component
    {
        id:headerComponent
        Rectangle
        {
            width: 80
            height: 20
            color: "yellow"
            Text {
                id: text
                anchors.centerIn: parent
                text: qsTr("HEADER")
        }
        }
    }
    Component
    {
        id:footerComponent
        Rectangle
        {
            width: 80
            height: 20
            color: "red"
            Text {
                id: text
                anchors.centerIn: parent
                text: qsTr("FOOTER")
            }
        }
    }

    Component
    {
        id:highlightComponent

        Rectangle
        {
            height: ListView.view.currentItem.height
            width: 80
            y:ListView.view.currentItem.y
            Behavior on y
            {
                SequentialAnimation {
                    PropertyAnimation { target: hightRectangle; property: "opacity"; to: 0; duration: 200 }
                    NumberAnimation { duration: 20 }
                    PropertyAnimation { target: hightRectangle; property: "opacity"; to: 1; duration: 200 }
                }
            }
            Rectangle
            {
                id:hightRectangle
                anchors.fill: parent
                color: "green"
            }
        }
    }

    Component
    {
        id:numberDelegate
         Item//一定要item
        {
            width: 80
            height: 40
            //color: "lightblue"
            Text {
                id: text
                anchors.centerIn: parent

                font.pixelSize: 10

                text: index
            }
        }
    }
}

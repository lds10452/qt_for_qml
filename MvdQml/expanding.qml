import QtQuick 2.0

Item {
    width: 300
    height: 480
    Rectangle
    {
        anchors.fill: parent
        gradient: Gradient
        {
            GradientStop{position: 0;color: "green"}
            GradientStop{position: 1;color: "yellow"}
        }
    }
    ListView
    {
        id:listview
        anchors.fill: parent
        delegate: detailsDelegate
        model: planets
    }
    ListModel
    {
        id:planets
        ListElement { name: "Mercury"; imageSource: "images/mercury.jpeg"; facts: "Mercury is the smallest planet in the Solar System. It is the closest planet to the sun. It makes one trip around the Sun once every 87.969 days." }
        ListElement { name: "Venus"; imageSource: "images/venus.jpeg"; facts: "Venus is the second planet from the Sun. It is a terrestrial planet because it has a solid, rocky surface. The other terrestrial planets are Mercury, Earth and Mars. Astronomers have known Venus for thousands of years." }
        ListElement { name: "Earth"; imageSource: "images/earth.jpeg"; facts: "The Earth is the third planet from the Sun. It is one of the four terrestrial planets in our Solar System. This means most of its mass is solid. The other three are Mercury, Venus and Mars. The Earth is also called the Blue Planet, 'Planet Earth', and 'Terra'." }
        ListElement { name: "Mars"; imageSource: "images/mars.jpeg"; facts: "Mars is the fourth planet from the Sun in the Solar System. Mars is dry, rocky and cold. It is home to the largest volcano in the Solar System. Mars is named after the mythological Roman god of war because it is a red planet, which signifies the colour of blood." }
    }
    Component
    {
        id:detailsDelegate
        Item {
            id: wrapper
            width: listview.width
            height: 30
            Rectangle
            {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: 30
                color: "black"
                border.color: Qt.lighter("blue",1.2)
                Text {
                    id: text
                    text: name
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4
                    font.pixelSize: parent.height-4
                    color: "white"
                }
            }
            Rectangle
            {
                id:image
                width: 26
                height: 26
                anchors.right: parent.right
                anchors.top:parent.top
                anchors.rightMargin: 2
                anchors.topMargin: 2
                color: "black"
                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: imageSource
                }
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked: parent.state="expande"
            }
            Item {
                id: factsView
                anchors.top:image.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                opacity: 0
                Rectangle
                {
                    anchors.fill: parent
                    gradient: Gradient
                    {
                        GradientStop{position: 0;color:"blue"}
                        GradientStop{position: 1;color: "green"}
                    }
                    border.color: "white"
                    border.width: 2
                    Text {
                        anchors.fill: parent
                        anchors.margins: 5
                        clip:true
                        wrapMode: Text.WordWrap
                        color: "black"
                        font.pixelSize: 12
                        text: facts
                    }
                }
            }
            Rectangle
            {
                id:closeButton
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 2
                anchors.topMargin: 2
                width: 26
                height: 26
                color: "green"
                border.color: Qt.lighter(color,1.2)
                opacity: 0
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        wrapper.state=""
                    }
                }
            }
            states: [
                State {
                    name: "expande"
                    PropertyChanges {
                        target: wrapper
                        height:listview.height
                    }
                    PropertyChanges {
                        target: image
                        width:listview.width
                        height:listview.width
                        anchors.rightMargin: 0
                        anchors.topMargin:30
                    }
                    PropertyChanges {
                        target: factsView
                        opacity:1
                    }
                    PropertyChanges {
                        target: closeButton
                        opacity:1
                    }
                    PropertyChanges {
                        target: wrapper.ListView.view
                        contentY:wrapper.y
                        interactive:false
                    }
                }
            ]
            transitions: [
                Transition {
                    NumberAnimation {
                        duration: 200
                        properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
                    }
                }
            ]
        }
    }
}

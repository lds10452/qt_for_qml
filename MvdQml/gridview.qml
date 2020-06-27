import QtQuick 2.0
//import QtQuick.Window 2.0
Rectangle {
    width: 480
    height: 300
    //visible: true
    gradient:Gradient
    {
        GradientStop{position: 0;color: "yellow"}
        GradientStop{position: 1;color: "blue"}
    }

    ListModel
    {
        id:themodel
        ListElement{number:0}
        ListElement{number:1}
        ListElement{number:2}
        ListElement{number:3}
        ListElement{number:4}
        ListElement{number:5}
        ListElement{number:6}
        ListElement{number:7}
        ListElement{number:8}
        ListElement{number:9}
    }

    Rectangle
    {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        height: 40
        color: "#ffddaa"
        property int count: 9
        Text {
            id: text
            text: qsTr("click me!")
            anchors.centerIn: parent
            font.pixelSize: 10
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                themodel.append({"number":parent.count++})
            }
        }
    }

    GridView
    {
        anchors.fill: parent
        anchors.bottomMargin: 80
        cellHeight:  45
        cellWidth:  45
        anchors.margins: 15
        clip: true
        model: themodel
        delegate: numberDelegate
    }
    Component
    {
        id:numberDelegate
        Rectangle
        {
            id:wrapper
            width: 40
            height: 40
            color: "green"
            Text {
                id: text
                text: number
                anchors.centerIn: parent
                font.pixelSize: 10
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    if(!wrapper.GridView.delayRemove)
                    {
                        themodel.remove(index)
                    }
                }
            }
            GridView.onRemove:SequentialAnimation
            {
                PropertyAction {
                    target: wrapper
                    property:"GridView.delayRemove"
                    value: true
                }

                NumberAnimation {
                    target: wrapper
                    property: "scale"
                    to:0
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
                PropertyAction
                {
                    target: wrapper
                    property: "GridView.delayRemove"
                    value:false
                }
            }
            GridView.onAdd:SequentialAnimation
            {
                NumberAnimation {
                    target: wrapper
                    property: "scale"
                    to:1
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}

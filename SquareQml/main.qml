import QtQuick 2.10
import QtQuick.Window 2.10

Window{
    id:root
    visible: true
    width: 640
    height: 480
    property var colorArray : ["red","green","gray"]
    //property alias inputone: input1
    //title: qsTr("Hello World")
    Column
    {
        anchors.fill: parent
        spacing: 8
        BlueSquare{}
        GreenSquare{width:64}
        RedSquare{width:64}
    }
    Row
    {
      anchors.right: parent.right
      spacing: 8
      BlueSquare{}
      RedSquare{}
      GreenSquare{height:66}
    }
    Grid
    {
        id:fourgrid
        columns: 2
        spacing: 8
        anchors.horizontalCenter: parent.horizontalCenter
        BlueSquare{}
        RedSquare{}
        GreenSquare{}
        GraySquare{}
    }
    Flow
    {
        width: 100
        height: 100
        spacing: 2
        anchors.bottom: parent.bottom
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        RedSquare{}
        GreenSquare{}
        GraySquare{}
    }
    TextInput
    {
        id:input1
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -33
        //color: "green"
        width: 64
        height: 44
        focus: true
        text:qsTr("123")
        KeyNavigation.tab:input2
    }
    TextInput
    {
        id:input2
        anchors.top:input1.bottom
        width: 64
        height: 44
        //color: "blue"
        focus: true
        text: "456"
        KeyNavigation.tab:input1
    }
    Rectangle
    {
        width: 96
        height: 66
        anchors.top: input2.bottom
        border.color: "red"
        TLineEditV1
        {
            id:input3
            text: input1.text

        }
        TLineEditV1
        {
            id:input4
            anchors.top:input3.bottom
            text:"2"
        }
    }
    Rectangle
    {
        width: 100
        height: 100
        border.color: "green"
        anchors.bottom: parent.bottom

        anchors.horizontalCenter: parent.horizontalCenter
        TLineEditV2
        {
           id:input5
        }
        TLineEditV2
        {
            anchors.top: input5.bottom
            id:input6
        }
    }
    BlueSquare
    {
        anchors.centerIn: parent
        GreenSquare
        {
            id:square
            width: 22
            height: 22
            anchors.centerIn: parent
        }
        focus: true
        Keys.onLeftPressed: square.width -= 8
        Keys.onRightPressed:square.width +=8
        Keys.onPressed:
        {
            switch(event.key)
            {
            case Qt.Key_Plus:
                square.height+=8
                square.scale+=0.2
                break;
            case Qt.Key_Minus:
                square.rotation+=20
                square.scale-=0.1
            }
        }
    }

    Rectangle
    {
        anchors.right: parent.right
        anchors.margins: 4
        anchors.bottom: parent.bottom
        width: 170
        height: 170
        Grid
        {
            id:repeatergrid
            anchors.fill: parent
            spacing:4
            anchors.margins: 4
            Repeater
            {
                model: 16
                Rectangle
                {
                    width: 40
                    height: 40
                    property int colorIndex: Math.floor(Math.random()*3)
                    color: root.colorArray[colorIndex]
                    border.color: Qt.lighter(color)
                    Text {
                        anchors.centerIn: parent
                        color:"blue"
                        text: qsTr("cell:")+index
                    }
                }
            }

        }
    }


}

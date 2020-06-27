import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2

Window {
    id:frmWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property alias thisImage: image
    MouseArea
    {
        anchors.fill: parent
        property point clickPos: "0,0"
        onClicked:
        {
            clickPos=Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged:
        {
            var delta=Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y)
            frmWindow.setX(frmWindow.x+delta.x)
            frmWindow.setY(frmWindow.y+delta.y)
        }
    }

    function setText()
    {
        text.text=textField.text
    }

    Rectangle
    {
        color: "red"
        width: 300
        height: 300
        //anchors.centerIn: parent
        focus: true
        Keys.enabled: true
        Keys.onPressed:
        {
            if(event.key===Qt.Key_Left)
            {
                parent.x-=10;
            }
            else if(event.key===Qt.Key_Right)
            {
                parent.x+=10;
            }
        }

        Button
        {
            id:button
            text: qsTr("图片1")
            width: 120
            height: 40
            anchors.centerIn: parent
    //        anchors.left: parent.left
    //        anchors.leftMargin: 12
    //        anchors.verticalCenter: parent.verticalCenter
            onClicked:
            {
                thisImage.source="qrc:/image/2-背景.png"
               //setText()
            }
        }
        Text {
            id: text
            text: qsTr("")
            height: 40
            width: 120
            anchors.bottom: button.top
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TextField
        {
            id:textField
            text:qsTr("")
            height: 40
            width: 120
            anchors.top:button.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Image {
            id: image
            //source: "file"
            height: 32
            width: 128
            anchors.bottom: text.top
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button
        {
            id:button1
            text: qsTr("图片2")
            height: 40
            width: 120
            anchors.top: textField.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                    image.source="qrc:/image/网站截图.png"
            }
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                onEntered:
                {
                     image.source="qrc:/image/2-背景.png"
                }
                onExited:
                {
                    image.source="qrc:/image/网站截图.png"
                }
            }
        }
    }
}

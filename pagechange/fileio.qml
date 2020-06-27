import QtQuick 2.0
import FileOpen 1.0
import QtQuick.Window 2.0
import Qt.labs.platform 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
Window {
    width: 640
    height: 320
    visible: true
    title: qsTr("fileopen")
    Row
    {
        width: 640
        height: 200
        Rectangle
        {
            width: 300
            height: 200
            color: "yellow"
            border.color: Qt.lighter("green")
//            anchors.right: mytextrec.left
//            anchors.rightMargin: 50
            TextEdit
            {
                id:inputtext
                anchors.fill: parent
                color: "blue"
                font.pixelSize: 15
                font.bold: true
                focus:true
                text:"input text"
            }
        }
        Rectangle
        {
            id:mytextrec
            width: 300
            height: 200
//            anchors.right: parent.right
    //        anchors.rightMargin: 20
            color: "red"
            Text {
                id: myText
                anchors.fill: parent
            }
        }
    }


    Rectangle
    {
        id:saverec
        width: 90
        height: 50
        color: "green"
        anchors
        {
            bottom:parent.bottom
            horizontalCenter:parent.horizontalCenter
            bottomMargin:30
            verticalCenterOffset:-120
        }
        Text {
            id: savebutton
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
            text: qsTr("保存")
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                fileOpen.write(inputtext.text);
                myText.text =  fileOpen.read();
            }
        }
    }
    Rectangle
    {
        width: 100
        height: 30
        color: "gray"
        border.color: Qt.lighter("green")
        anchors.right: saverec.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 35
        anchors.rightMargin: 20
        TextInput
        {
            id:filename
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: true
            color: "blue"
            focus: true
            text: "file.txt"
        }
    }

    FileOpen{
        id: fileOpen
        source: filename.text
    }


}

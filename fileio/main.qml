import QtQuick 2.0
import FileOpen 1.0
import QtQuick.Window 2.0
Window {
    width: 640
    height: 320
    visible: true
    title: qsTr("fileopen")
    Text {
        id: myText
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            fileOpen.write("Hello world!!!");
            myText.text =  fileOpen.read();
        }
    }
    TextInput
    {
        id:filename
        text: "file.txt"
    }

    FileOpen{
        id: fileOpen
        source: filename.text
    }


}

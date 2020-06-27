import QtQuick 2.0

Rectangle {
    width: 300
    height: 290
    ListView
    {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: spaceMan
        delegate: spaceManDelegate
        section.property: "nation"
        section.delegate: sectionDelegate
    }
    Component
    {
        id:spaceManDelegate
        Rectangle
        {
            width: 260
            height: 20
            color: "gray"
            Text {
                id: text
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 10
                text: name
            }
        }
    }
    Component
    {
        id:sectionDelegate
        Rectangle
        {
            width: 260
            height: 20
            color: "yellow"
            Text {
                id: text
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: 12
                text: section
            }
        }
    }
    ListModel
    {
        id:spaceMan
       ListElement { name: "Abdul Ahad Mohmand"; nation: "Afganistan"; }
       ListElement { name: "Marcos Pontes"; nation: "Brazil"; }
       ListElement { name: "Alexandar Panayotov Alexandrov"; nation: "Bulgaria"; }
       ListElement { name: "Georgi Ivanov"; nation: "Bulgaria"; }
       ListElement { name: "Roberta Bondar"; nation: "Canada"; }
       ListElement { name: "Marc Garneau"; nation: "Canada"; }
       ListElement { name: "Chris Hadfield"; nation: "Canada"; }
       ListElement { name: "Guy Laliberte"; nation: "Canada"; }
       ListElement { name: "Steven MacLean"; nation: "Canada"; }
       ListElement { name: "Julie Payette"; nation: "Canada"; }
       ListElement { name: "Robert Thirsk"; nation: "Canada"; }
       ListElement { name: "Bjarni Tryggvason"; nation: "Canada"; }
       ListElement { name: "Dafydd Williams"; nation: "Canada"; }
    }
}

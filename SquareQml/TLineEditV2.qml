import QtQuick 2.0

FocusScope
{
    width: 80
    height: 40
    Rectangle
    {
        anchors.fill: parent
        color: "blue"
        border.color: Qt.lighter(color)
    }
    property alias text: input.text
    property alias input: input
    TextInput
    {
        id:input
        anchors.fill: parent
        anchors.margins: 4
        focus: true
    }
}

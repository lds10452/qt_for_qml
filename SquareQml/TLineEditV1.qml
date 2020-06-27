import QtQuick 2.0

Rectangle
{
    width: 66
    height: 32
    color: "gray"
    border.color: Qt.lighter(color)
    property alias text: input.text
    TextInput
    {
        id:input
        anchors.fill: parent
        anchors.margins: 8
        focus: true
    }
}

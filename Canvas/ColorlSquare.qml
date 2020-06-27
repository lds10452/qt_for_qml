import QtQuick 2.0

Rectangle
{
    id:root
    width: 48
    height: width
    signal click
    property bool active: false
    border.color: active?Qt.lighter("white"):""
    border.width: 3
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            root.click()
        }
    }
}

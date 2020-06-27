import QtQuick 2.0
import QtQuick.Window 2.10
Window {
    id:root
    visible: true
    width: 480
    height: 360
    title:qsTr("easing")
    property variant easings : [
        "Linear", "InQuad", "OutQuad", "InOutQuad",
        "InCubic", "InSine", "InCirc", "InElastic",
        "InBack", "InBounce" ]
    Image {
        id: backgruond
        source: "qrc:/iamge/background.png"
        anchors.fill: parent
    }
    Grid
    {
       id: easingsgrid
       anchors.top:parent.top
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.margins: 10
       spacing: 10
       columns: 5
       width: 450
       height: 190
       Repeater
       {
           model: easings
           Rectangle
           {
               width: 80
               height: 80
               anchors. margins:10
               color: "red"
               Text {
                   id: text
                   text: modelData
                   anchors.centerIn: parent
               }
               MouseArea
               {
                   anchors.fill: parent
                   onClicked:
                   {
                       anim.easing.type=modelData
                       anim.start()
                   }
               }
           }
       }
    }
    Rectangle
    {
        id:square
        width: 40
        height: 40
        x:40
        y:280
//        anchors.bottom: parent.bottom
//        anchors.margins: 20
//        anchors.leftMargin: 20
        color: "blue"
    }

    NumberAnimation {
        id:anim
        target: square
        property: "x"
        from: 40
        to:root.width-40-square.width
        duration: 2000
    }
}

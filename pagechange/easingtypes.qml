import QtQuick 2.0
import QtQuick.Window 2.10
Window {
    id:root
    visible: true
    width: 480
    height: 420
    title:qsTr("easing")
    property variant easings : [
        "Linear", "InQuad", "OutQuad", "InOutQuad",
        "InCubic", "InSine", "InCirc", "InElastic",
        "InBack", "InBounce" ]
   Rectangle
   {
    id:background
    width: root.width
    height: root.height-130
    border.color: Qt.lighter("green")
    Image {
        id: backgruond
        source: "iamges/background.png"
        anchors.fill: parent
    }
   }
    Grid
    {
       id: easingsgrid
       anchors.top:background.bottom
       anchors.leftMargin: 5
       anchors.margins: 5
       spacing: 5
       columns: 5
       width: 450
       height: 190
       Repeater
       {
           model: easings
           Rectangle
           {
               width: (root.width-30)/5
               height: 60
               radius: 10
               anchors. margins:10
               color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
               Text {
                   id: text
                   text: modelData
                   anchors.centerIn: parent
               }
               MouseArea
               {
                   id:recarea
                   anchors.fill: parent
                   onClicked:
                   {
                       square.x=background.x+20
                       square.y=background.height-70
                       square.rotation=0
                       xani.easing.type=modelData
                       yaniup.easing.type=modelData
                       yanidown.easing.type=modelData
                       anim.start()
                   }
               }
           }
       }
    }
    Rectangle
    {
        id:square
        width: 60
        height: 60
        radius: 30
        x:background.x+20
        y:background.height-70
        Image {
            id: image
            anchors.fill: parent
            source: "images/soccer_ball.png"
        }
    }
    Image {
        id: imageshader
        x:square.x-35
        y:background.height-19
        scale: 0.7
        source: "images/soccer_shadow.png"
    }
    ParallelAnimation
    {
        id:anim
        NumberAnimation {
            id:xani
            target: square
            property: "x"
            from: 40
            to:root.width-40-square.width
            duration: 2000
            //easing.type:type
        }
        RotationAnimation
        {
            target: square
            property: "rotation"
            to:720
            duration: 2200
        }

        SequentialAnimation
        {
            NumberAnimation {
                id:yaniup
                target: square
                property: "y"
                duration: 700
                to:40
            }

            NumberAnimation {
                id:yanidown
                target: square
                property: "y"
                duration: 1300
                to:background.height-70
            }
        }
    }
}

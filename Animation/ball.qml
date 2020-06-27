import QtQuick 2.0
import QtQuick.Window 2.10
Window {
    id:root1
    width: 640
    height: 380
    visible: true
    property int duration: 3000
    title: qsTr("ball")
    Rectangle {
        id: sky
        width: parent.width
        height: 200
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0080FF" }
            GradientStop { position: 1.0; color: "#66CCFF" }
        }
    }
    Rectangle {
        id: ground
        anchors.top: sky.bottom
        //anchors.bottom: root1.bottom
        width: parent.width
        height: 180
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00FF00" }
            GradientStop { position: 1.0; color: "#00803F" }
        }
    }

    Image {
        id: soccer
        x:0
        y:240
        scale: 0.5
//        width: 40
//        height: 40
        source: "iamge/soccer_ball.png"
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                soccer.x=20
                soccer.y=240
                soccer.rotation=0
                anim.start()
            }
        }
    }
    Image {
        id: shadow
        x:soccer.x
        y:360
        source: "iamge/soccer_shadow.png"
    }
    ParallelAnimation
    {
        id:anim

        NumberAnimation {
            target: shadow
            property: "x"
            duration: root1.duration
            to:soccer.x
        }
        NumberAnimation {
            target: soccer
            property: "x"
            duration: root1.duration
            to:400
        }
        RotationAnimation
        {
          target: soccer
          to:720
          property: "rotation"
          duration: root1.duration*1.1
        }
        SequentialAnimation
        {

            NumberAnimation {
                target: soccer
                property: "y"
                duration: 0.4*root1.duration
                to:20
                easing.type: Easing.OutCirc
            }

            NumberAnimation {
                target: soccer
                property: "y"
                duration: 0.6*root1.duration
                to:240
                easing.type: Easing.OutBounce
            }
        }
    }
}

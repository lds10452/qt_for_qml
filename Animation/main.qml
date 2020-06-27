import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Image {
        //id: root
        source: "qrc:/iamge/background.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                rocket.x=40
                rocket.rotation=0

            }
        }
        }
    Image {
        id: rocket
        //height: 10
        source: "qrc:/iamge/rocket.png"
        x:40
        y:220

        //running启动动画
        MouseArea
        {
            id:marea
            anchors.fill: parent

        }

        NumberAnimation {
            targets: [rocket]
            properties: "y"
            //from:40
            to:10
            duration: 4000
            running:marea.pressed
        }

//      start启动动画
 //       MouseArea
//        {
//            anchors.fill: parent
//            onClicked: anim.start()
//        }

//        NumberAnimation
//        {
//            id:anim
//            target: rocket
//            properties: "y"
//            from: 100
//            to:40
//            duration: 1000
//        }
           // 属性动作启动动画
//        Behavior on y
//        {
//            NumberAnimation{duration: 4000}
//        }
//        MouseArea
//        {
//            anchors.fill: parent
//            onClicked: rocket.y=40
//        }
           // 自动启动动画
//        NumberAnimation on x
//        {
//            to:440
//            duration:4000
//            //loops:Animation.Infinite
//        }
//        RotationAnimation on rotation {
//            to:360
//            duration: 4000
//           //loops: Animation.Infinite
//        }
    }
}


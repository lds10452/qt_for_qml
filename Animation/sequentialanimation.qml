import QtQuick 2.0
import QtQuick.Window 2.10
Window {
    id:root
    width: 500
    height: 400
    visible: true
    title: qsTr("sequential")
    property int duration: 2000
    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            ufo.x=40
            ufo.y=220
            rocket.x=40
            rocket.y=10
        }
    }

    Image {
        id: back
        source: "qrc:/iamge/background.png"
        anchors.fill: root
    }
    Image {
        id: ufo
        x:40
        y:220
        width: 40
        height: 40
        source: "qrc:/iamge/ufo.png"
        MouseArea
        {
            anchors.fill: ufo
            onClicked:
            {
                anim.restart()
            }
        }
    }
    Image {
        id: rocket
        width: 30
        height: 60
        source: "qrc:/iamge/rocket.png"
        x:40
        y:10
        MouseArea
        {
            anchors.fill: rocket
            onClicked:
            {
                animp.start()
            }
        }
    }
    ParallelAnimation
    {
        id:animp

        NumberAnimation {
            target: rocket
            property: "y"
            duration: root.duration
            to:270
        }

        NumberAnimation {
            target: rocket
            property: "x"
            duration: root.duration
            to:270
        }
    }

    SequentialAnimation
    {
        id:anim

        NumberAnimation {
            target: ufo
            property: "x"
            to:270
            duration: root.duration
        }

        NumberAnimation {
            target: ufo
            property: "y"
            to:70
            duration: root.duration
        }
    }
}

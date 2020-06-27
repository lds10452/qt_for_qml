import QtQuick 2.10
import QtQuick.Window 2.10

Window {

    // set width based on given background
    visible: true
    width: 400
    height: 300
    property alias rocketw: rocket1.width
    property alias rocketh: rocket1.height
    Image {
        // nice background image
        id: bg
        source: "qrc:/QImage/background.png"
        anchors.fill: parent
        MouseArea {
            id: backgroundClicker
            anchors.fill: parent
            onClicked: {
                // reset our little scene
                rocket1.x = 20
                rocket2.rotation = 0
                rocket3.rotation = 0
                rocket3.scale = 1.0
                }
        }
        Image  {

            id: rocket1
            x: 20; y: 10
            source: "qrc:/QImage/rocket1.png"
            MouseArea
            {
                anchors.fill: parent
            onClicked: {
                rocket1.x += 5 }}
        }
        Image {
            id: rocket2
            x: 140; y: 10
            source:"qrc:/QImage/rocket2.png"
            smooth: true
            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                rocket2. rotation += 5
            }
            }
        }
        Image {
            id: rocket3
            x: 260; y: 10
            source: "qrc:/QImage/rocket3.png"
            smooth: true
            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                   rocket3. rotation += 5
                   rocket3. scale -= 0.05
                }
            }


        }
  }
}

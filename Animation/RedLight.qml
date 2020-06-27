import QtQuick 2.9

Rectangle {
    id:root
    //visible: true
    width: 150
    height: 250
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#2ed5fa" }
        GradientStop { position: 1.0; color: "#2467ec" }
    }

        Rectangle {
            id: light1
            x: 25; y: 15
            width: 100; height: width
            radius: width/2
            color: "black"
            border.color: Qt.lighter(color, 1.1)
        }

        Rectangle {
            id: light2
            x: 25; y: 135
            width: 100; height: width
            radius: width/2
            color: "black"
            border.color: Qt.lighter(color, 1.1)
        }
    state: "stop"

    states: [
        State {
            name: "go"
            PropertyChanges {
                target: light2
                color:"green"
            }
            PropertyChanges {
                target:light1
                color:"black"
            }

        },
        State {
            name: "stop"
            PropertyChanges {
                target: light2
                color:"black"
            }
            PropertyChanges {
                target: light1
                color:"red"
            }
        }
    ]
    MouseArea
    {
      anchors.fill: parent
      onClicked: root.state=(root.state=="stop"?"go":"stop")
    }
    transitions:
    [
        Transition {
            from: "stop"
            to: "go"

            ColorAnimation {
                target: light1
                //properties: "color"
                from:"red"
                to:"yellow"
                duration: 2000
            }

            ColorAnimation {
                target: light2
                properties:"color"
                duration: 2000
            }
        },
        Transition {
            from: "go"
            to: "stop"

            ColorAnimation {
                target: light1
                properties: "color"
                duration: 2000
            }

            ColorAnimation {
                target: light2
                properties:"color"
                duration: 2000
            }
        }
    ]
}


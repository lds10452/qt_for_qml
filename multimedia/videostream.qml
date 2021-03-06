import QtQuick 2.0
import QtMultimedia 5.0
Rectangle {
    id: root

    width: 1024
    height: 600

    color: "black"

    // M1>>
    VideoOutput {
        anchors.fill: parent
        source: camera
    }

    Camera {
        id: camera
    }
    // <<M1

    // M2>>
    ListModel {
        id: imagePaths
    }

    ListView {
        id: listView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        height: 100

        orientation: ListView.Horizontal
        spacing: 10

        model: imagePaths

        delegate: Image { source: path; fillMode: Image.PreserveAspectFit; height: 100; }

        Rectangle {
            anchors.fill: parent
            anchors.topMargin: -10

            color: "black"
            opacity: 0.5
        }
    }
    // <<M2

    Image {
        id: image
        anchors.fill: parent
    }

    // M3>>
    Connections {
        target: camera.imageCapture

        onImageSaved: {
            imagePaths.append({"path": path})
            listView.positionViewAtEnd();
        }
    }
    // <<M3

    Column {
        id: buttons

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10

        spacing: 10

        // M4>>
        Button {
            id: shotButton

            width: 200
            height: 75

            text: "Take Photo"
            onClicked: {
                camera.imageCapture.capture();
            }
        }
        // <<M4

        Button {
            id: playButton

            width: 200
            height: 75

            text: "Play Sequence"
            onClicked: {
                startPlayback();
            }
        }

        Button {
            id: clearButton

            width: 200
            height: 75

            text: "Clear Sequence"
            onClicked: {
                imagePaths.clear();
            }
        }
    }

    // M5>>
    property int _imageIndex: -1

    function startPlayback()
    {
        root.state = "playing";
        setImageIndex(0);
        playTimer.start();
    }

    function setImageIndex(i)
    {
        _imageIndex = i;

        if (_imageIndex >= 0 && _imageIndex < imagePaths.count)
            image.source = imagePaths.get(_imageIndex).path;
        else
            image.source = "";
    }

    Timer {
        id: playTimer

        interval: 200
        repeat: false

        onTriggered: {
            if (_imageIndex + 1 < imagePaths.count)
            {
                setImageIndex(_imageIndex + 1);
                playTimer.start();
            }
            else
            {
                setImageIndex(-1);
                root.state = "";
            }
        }
    }
    // <<M5

    states: [
        State {
            name: "playing"
            PropertyChanges {
                target: buttons
                opacity: 0
            }
            PropertyChanges {
                target: listView
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition { PropertyAnimation { properties: "opacity"; duration: 200; } }
    ]
}

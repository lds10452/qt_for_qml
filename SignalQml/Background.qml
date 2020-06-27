import QtQuick 2.0

Item {
    property Sender target: null
    focus: true
    Keys.onPressed:
    {
        if(event.key===Qt.Key_Plus)
        {
            target.width+=10;
        }
        else if(event.key===Qt.Key_1)
        {
            target.width-=10;
        }
    }

    Rectangle {
        id: rectangle
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#eafef4"
            }

            GradientStop {
                position: 1
                color: "#1df489"
            }
        }
        anchors.fill: parent
    }

}

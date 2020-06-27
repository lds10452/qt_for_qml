import QtQuick 2.0

Circle {
    id:recevier
    function receive(value)
    {
        contentText=value;
        colornotify.running=true;
    }
    SequentialAnimation on circleColor {
        id:colornotify
        running: false

        ColorAnimation {
            from: "red"
            to: "blue"
            duration: 200
        }

        ColorAnimation {
            from: "blue"
            to: "red"
            duration: 200
        }
    }
}

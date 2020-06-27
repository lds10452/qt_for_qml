import QtQuick 2.0

Circle {
    id:sender
    property int counter: 0
    signal send(string value)
    property Receiver target: null
    onTargetChanged:
    {
        send.connect(target.receive);
    }
    MouseArea
    {
       anchors.fill: parent
       onClicked:
       {
           sender.counter++;
           sender.send(counter);
       }
       onPressed:
       {
           sender.circleColor="blue";
       }
       onReleased:
       {
           sender.circleColor="red";
       }
    }
}

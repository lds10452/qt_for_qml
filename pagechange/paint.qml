import QtQuick 2.0
import QtQuick.Window 2.0
Window
{
   id:root
   visible: true
   width: 400
   height: 300
   color: "black"
   title: "paint"
   Row
   {
       id:colorTools
       anchors
       {
           horizontalCenter:parent.horizontalCenter
           top:parent.top
           topMargin:8
       }
       //property var activeSquare: redSquare
       property color paintColor: "red"
       spacing: 4
       Repeater
       {
           model: ["red","yellow","gray","blue"]
           ColorlSquare
           {
               id:red
               color: modelData
               active: parent.paintColor==color
               onClick:
               {
                   parent.paintColor=color
               }
           }

       }
   }
   Rectangle
   {
       anchors.fill: canvas
       border.color: "gray"
       border.width: 5
   }

   Canvas
   {
       id:canvas
       anchors
       {
           top:colorTools.bottom
           left:parent.left
           right:parent.right
           bottom:parent.bottom
           margins:8
       }
       property real lastX
       property real lastY
       property color color: colorTools.paintColor
       onPaint:
       {
           var ctx=getContext('2d')
           ctx.lineWidth=2
           ctx.strokeStyle=canvas.color
           ctx.beginPath()
           ctx.moveTo(lastX,lastY)
           lastX=area.mouseX
           lastY=area.mouseY
           ctx.lineTo(lastX,lastY)
           ctx.stroke()
       }
        MouseArea
        {
            id:area
            anchors.fill: parent
            onPressed:
            {
                canvas.lastX=mouseX
                canvas.lastY=mouseY
            }
            onPositionChanged:
            {
                canvas.requestPaint()
            }
        }
   }
//   Rectangle{
//      width: 30
//      height: 30
//      anchors.top: parent.top
//      anchors.right: parent.right
//      Image {
//          id: image
//          anchors.fill: parent
//          source: "image/shell32_240.ico"
//      }
//      MouseArea
//      {
//          anchors.fill: parent
//          onClicked:
//          {
//             sourcepage.source="main.qml"
//          }
//      }

//   }
//   Loader
//   {
//       id:sourcepage
//   }
}

import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.0
Window {
    id:root
    visible: true
    width: 640
    height: 420
    title: qsTr("小游戏")
    property int count:0
   Image {
       id: image
       anchors.fill: parent
       source: "image/81.jpg"
         }
   Text {
           id: text
           anchors.horizontalCenter: image.horizontalCenter
           anchors.bottom:gridview.top
           anchors.bottomMargin: 30
           text: qsTr("请选择一个按钮点击")
           font.pixelSize: 40
           font.bold: true
       }
   Text {
       id: textleft
       anchors.bottom: image.bottom
       anchors.bottomMargin: 60
       font.pointSize: 20
       font.bold: true
       text: qsTr("0.路径视图
1.时钟
2.缓冲曲线
3.OPENGL
4.画画
5.读写文件
                 ")
   }

    GridView
    {
        id:gridview
        width: 300
        height: 300
        anchors.bottom: image.bottom
        anchors.horizontalCenter: image.horizontalCenter
        cellWidth:100
        cellHeight:100
        model: ListModel
        {
            id:themodel
            ListElement{number:0}
            ListElement{number:1}
            ListElement{number:2}
            ListElement{number:3}
            ListElement{number:4}
            ListElement{number:5}
            ListElement{number:6}
            ListElement{number:7}
            ListElement{number:8}
        }
        delegate: delegrid
    }
    Component
    {
        id:delegrid
        Rectangle
        {
            id:rec
           width: 90
           height: 90
           radius: width/2
           border.color: Qt.lighter("black")
           color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
           Text {
               id: text
               text: index
               anchors.centerIn: parent
               font.pixelSize: 20
           }
           MouseArea
           {
               anchors.fill: parent
               onClicked:
               {
                   colorselect()
                   changePage()
               }
           }
           Behavior on color
           {
               PropertyAnimation{duration: 500}
           }

           function colorselect()
           {
               count++;
               switch(count%2)
               {
               case 0:rec.color="red";break;
               case 1:rec.color="green";break;
               //default:rec.color="gray";break;
               }
           }
           function changePage()
           {
               switch(text.text)
               {
                   case "0":loaderSource.source="pathview.qml";text.text="0";break;
                   case "1":loaderSource.source="clock.qml";text.text="1";break;
                   case "2":loaderSource.source="easingtypes.qml";text.text="2";break;
                   case "3":loaderSource.source="fragement.qml";text.text="3";break;
                   case "4":loaderSource.source="paint.qml";text.text="4";break;
                   case "5":loaderSource.source="fileio.qml";text.text="5";break;
               }
           }
        }

    }
   Loader
   {
       id:loaderSource
   }
}


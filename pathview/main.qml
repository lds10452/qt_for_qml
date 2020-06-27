import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.0
Window {
    id:root
    visible: true
    width: 480
    height: 300
    title: qsTr("pathview")
    PathView
    {
        id:pathview
        anchors.fill: parent
        pathItemCount: 7
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        delegate: rectDelegate
        model: ListModel
        {
            id:listmodel
            ListElement{imageSource:"fengjing/XuebaExport_1475728338137.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728346422.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728354632.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728362871.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728369482.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728376116.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728383712.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728390148.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728390148.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728397199.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728402906.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728409651.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728416042.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728422297.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728428396.jpg"}
            ListElement{imageSource:"fengjing/XuebaExport_1475728434064.jpg"}
        }

        path: Path
        {
            startX:10
            startY:root.height/2-80
            PathAttribute{name: "z";value: 0}
            PathAttribute{name:"itemOpacity";value: 0.1}
            PathAttribute{name:"itemScale";value: 0.5}
            PathLine
            {
                x:root.width/2-50
                y:root.height/2-90
            }
            PathPercent{value:0.48}
            PathAttribute{name: "z";value: 10}
            PathAttribute{name:"itemOpacity";value: 1}
            PathAttribute{name:"itemScale";value: 1}
            PathLine
            {
                x:root.width/2+50
                y:root.height/2-90
            }
            PathPercent{value:0.52}
            PathLine
            {
                x:root.width-10
                y:root.height/2-80
            }
            PathAttribute{name: "z";value: 0}
            PathAttribute{name:"itemOpacity";value: 0.1}
            PathAttribute{name:"itemScale";value: 0.5}

        }
        focus: true
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
    }
    Component
    {
        id:rectDelegate
        Item {
            id: wrapper
            z:PathView.z
            opacity: PathView.itemOpacity
            scale: PathView.itemScale
            Rectangle
            {
                width: 250
                height: 180
                border.color: wrapper.PathView.isCurrentItem? Qt.lighter("green"):""
                border.width: 3
                Image {
                    id: image
                    anchors.fill: parent
                    source: imageSource
                }
            }
        }
    }
}

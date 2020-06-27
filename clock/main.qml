import QtQuick 2.0
import QtQuick.Window 2.0
Window
{
    width: 480
    height: 480
    visible: true
    title: qsTr("clock")
    Rectangle
    {
        id:root
        anchors.centerIn: parent
        width: 200
        height: 200
        color: "transparent"
        property int time_H : 0;
        property int time_M : 0;
        property int time_S : 0;
        property int i: 0
        Timer
        {
                interval: 500; running: true; repeat: true
                onTriggered:
                {
                    time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
                    root.time_H = Qt.formatDateTime(new Date(), "hh")
                    root.time_M = Qt.formatDateTime(new Date(), "mm")
                    root.time_S = Qt.formatDateTime(new Date(), "ss")
                }
        }
        Canvas
        {
            anchors.fill: parent
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                ctx.strokeStyle = "black";
                ctx.globalAlpha = 1.0;
                ctx.beginPath();
                ctx.arc(100,100,99,0,2*Math.PI);
                ctx.stroke();
                //ctx.restore();
                for(var i =0;i<12;i++)
                {
                    ctx.save();
                    ctx.translate(width/2,height/2);
                    ctx.rotate(((i)*30)*Math.PI/180);
                    ctx.beginPath();
                    ctx.lineWidth = 1;
                    if(i==0)
                    {
                        ctx.save()
                        ctx.rotate(0)
                        ctx.strokeText("12",-2,-75)
                        ctx.restore();
                    }
                    if(i==3)
                    {
                        ctx.save()
                        ctx.rotate(-((i)*30)*Math.PI/180)
                        ctx.strokeText("3",75,0)
                        ctx.restore();
                    }
                    if(i==6)
                    {
                        ctx.save()
                        ctx.rotate(-((i)*30)*Math.PI/180)
                        ctx.strokeText("6",0,75)
                        ctx.restore();
                    }
                    if(i==9)
                    {
                        ctx.save()
                        ctx.rotate(-((i)*30)*Math.PI/180)
                        ctx.strokeText("9",-75,0)
                        ctx.restore();
                    }
                    ctx.lineWidth = 2;
                    //判定长短线
                    if(i%3 == 0)
                    {
                        ctx.moveTo(0,-99+15);
                        ctx.lineTo(0,-99+2);
                    }
                    else
                    {
                        ctx.moveTo(0,-99+10);
                        ctx.lineTo(0,-99+2);
                    }
                    //绘制
                    ctx.stroke();
                    ctx.restore();
                }
            }
        }
        Canvas
        {
            id:m_Hour
            property int m_Radius: (root.width>=root.height)? (root.height)/2 : (root.width)/2
            width: m_Radius*2
            height: m_Radius*2
            anchors.centerIn: parent
            rotation: (root.time_H%12)*30 + root.time_M/2 + root.time_S/120-180
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                ctx.fillStyle = "blue";
                ctx.strokeStyle = "blue";
                ctx.beginPath()
                ctx.moveTo(m_Radius,m_Radius)
                ctx.lineTo(m_Radius+4,m_Radius+m_Radius*0.5)
                ctx.lineTo(m_Radius,m_Radius*2-37)
                ctx.lineTo(m_Radius-4,m_Radius+m_Radius*0.5)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }

        }
        Canvas
        {
            id:m_Min
            property int m_Radius: (root.width>=root.height)? (root.height)/2 : (root.width)/2
            width: m_Radius*2
            height: m_Radius*2
            anchors.centerIn: parent
            rotation: root.time_M*6 + root.time_S*6/60-180
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                ctx.fillStyle = "yellow";
                ctx.strokeStyle = "yellow";
                ctx.beginPath()
                ctx.moveTo(m_Radius,m_Radius)
                ctx.lineTo(m_Radius+2,m_Radius+m_Radius*0.5)
                ctx.lineTo(m_Radius,m_Radius*2-32)
                ctx.lineTo(m_Radius-2,m_Radius+m_Radius*0.5)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }
        }
        Canvas
        {
            id:m_Second
            property int m_Radius: (root.width>=root.height)? (root.height)/2 : (root.width)/2
            width: m_Radius*2
            height: m_Radius*2
            anchors.centerIn: parent
            rotation: root.time_S*6-180
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                ctx.fillStyle = "red";
                ctx.strokeStyle = "red";
                ctx.beginPath()
                ctx.moveTo(m_Radius,m_Radius)
                ctx.lineTo(m_Radius+1,m_Radius+m_Radius*0.5)
                ctx.lineTo(m_Radius,m_Radius*2-28)
                ctx.lineTo(m_Radius-1,m_Radius+m_Radius*0.5)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }
        }
        Text {
            id:time
            anchors.centerIn: parent
            color: "#00FF00"
            font.family: "微软雅黑"
            font.pixelSize: 16
            text: qsTr("22:22:22")
        }
    }
}

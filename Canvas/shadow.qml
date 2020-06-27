import QtQuick 2.0

Canvas
{
    id:canvas
    width: 200
    height: 200
    smooth: true
    onPaint:
    {
        var ctx=getContext("2d")
        //ctx.strokeStyle="red"
        ctx.fillStyle="green"
        ctx.fillRect(0,0,canvas.width,canvas.height)
        ctx.shadowColor="blue"
        //ctx.shadowBlur = 10
        ctx.shadowOffsetX=1
//        ctx.shadowOffsetY=2
        ctx.font='bold 80px 黑体'
        ctx.fillText("china",0,100)
    }
}

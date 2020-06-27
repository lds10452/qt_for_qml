import QtQuick 2.0

Canvas
{
    id:root
    width: 200
    height: 200
    onPaint:
    {
        var ctx=getContext("2d")
        ctx.lineWidth=4
        ctx.strokeStyle="yellow"
        var gradient=ctx.createLinearGradient(50,0,50,200)
        gradient.addColorStop(0,"blue")
        gradient.addColorStop(0.5,"yellow")
        ctx.fillStyle=gradient
//        矩形1
        ctx.fillRect(20,20,80,80)
//        ctx.clearRect(30,30,60,60)
        ctx.strokeRect(30,30,40,40)
    }
}

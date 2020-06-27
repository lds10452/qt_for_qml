import QtQuick 2.0

Canvas {
    id: root
    width: 240; height: 120
    onPaint: {
        var ctx = getContext("2d")
        ctx.scale(0.5,0.5)
        ctx.strokeStyle = "blue"
        ctx.lineWidth = 4
        ctx.rect(20, 20, 40, 40)
        ctx.stroke()
        ctx.save()
        // draw path now rotated
        ctx.strokeStyle = "green"
        ctx.translate(40,0)
        ctx.rotate(Math.PI/4)
        ctx.rect(20*1.414-20, 20*1.414-20, 40, 40)
        //ctx.closePath()
        ctx.stroke()
        ctx.restore()
    }
}

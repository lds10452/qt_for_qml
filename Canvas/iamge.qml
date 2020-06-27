import QtQuick 2.0

Canvas {
    id: root
    width: 400; height: 120

    // M1>>
    onPaint: {
        var ctx = getContext("2d")


        // draw an image
        ctx.drawImage('images/soccer_ball.png', 100, 100)

        // store current context setup
        ctx.save()
        ctx.strokeStyle = 'red'
        // create a triangle as clip region
        ctx.beginPath()
        ctx.moveTo(10,10)
        ctx.lineTo(155,10)
        ctx.lineTo(85,155)
        ctx.closePath()
        // translate coordinate system
        ctx.translate(200,0)
        ctx.clip()  // create clip from triangle path
        // draw image with clip applied
        ctx.drawImage('images/soccer_ball.png', 100, 100)
        // draw stroke around path
        ctx.stroke()
        // restore previous setup
        ctx.restore()

    }

    Component.onCompleted: {
        loadImage("images/soccer_ball.png")
    }
    // <<M1
}

import QtQuick 2.10

Rectangle
{
    width: 480
    height: 240
    color: "green"
    Row
    {
        anchors.fill: parent
        spacing: 20
        Image {
            id: sourceImage
            width: 80
            height: width
            source: "iamges/pinwheel.png"
        }
        ShaderEffect
        {
            id:effect
            width:80
            height: width
            property var picture: sourceImage
            vertexShader: "
                uniform highp mat4 qt_Matrix;
                attribute highp vec4 qt_Vertex;
                attribute highp vec2 qt_MultiTexCoord0;
                varying highp vec2 qt_TexCoord0;
                void main() {
                    qt_TexCoord0 = qt_MultiTexCoord0;
                    gl_Position = qt_Matrix * qt_Vertex;
                }"
            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D picture;
                uniform lowp float qt_Opacity;
                void main() {
                    gl_FragColor = texture2D(picture, qt_TexCoord0) * qt_Opacity;
                }"
        }
    }
}

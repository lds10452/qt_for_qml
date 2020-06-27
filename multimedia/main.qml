import QtQuick 2.10
import QtMultimedia 5.9

  Item {
      id:window
      width: 1024
      height: 600
      states:[
          State {
              name: "rotationact"
              PropertyChanges {
                  target: button;rotation:180
              }
          }
      ]
      MouseArea
      {
          anchors.fill: parent
          onClicked:
          {
              if(window.state==="rotationact")
              {
                  window.state=""
              }
              else
              {
                  window.state="rotationact"
              }
          }
      }
      SoundEffect
      {
          id:beep
          source: "beep.wav"
          volume: 10
          loops: SoundEffect.Infinite
      }

      Rectangle
      {
          id:button
          anchors.centerIn: parent
          width: 200
          height: 100
          color: "blue"
          MouseArea
          {
              anchors.fill: parent
              onClicked: beep.play()
          }
      }


      SoundEffect
      {
          id:rotationbeep
          source: "swosh.wav"
      }

      transitions: [
          Transition {
              ParallelAnimation
              {
                  PropertyAnimation
                  {
                      properties:"rotation"
                      duration: 500
                  }
                  ScriptAction
                  {
                      script: rotationbeep.play()
                  }
              }
          }
      ]
  }

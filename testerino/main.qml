import QtQuick 2.3
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: mainPage
    visible: true
    width: 640
    height: 480
    title: qsTr("Wasm is god")

    ComboBox {
        anchors.horizontalCenter: imageDisplay.horizontalCenter
        anchors.bottom: imageDisplay.top
       id: imageBox
        model: ListModel {
            id: modelOfImages
               ListElement { text: "brooke.jpg" }
               ListElement { text: "chad.jpg" }
               ListElement { text: "dino.jpg" }
        }
    }

    Image {
        id: imageDisplay
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 50
        }

        width: mainPage.width/2
        height: mainPage.height/2
        source: imageBox.currentText
        fillMode: Image.PreserveAspectFit
    }
    TextField {
        anchors {
            left: imageDisplay.left
            right: imageDisplay.right
            top: imageDisplay.bottom
        }
        selectByMouse: true
        id: textStuff
        placeholderText: qsTr("text me up")
        onEditingFinished: {
            stackView.push(textItem, {"text":textStuff.text.toString(),"rotation":stackView.depth*25})
            textStuff.clear()
        }
    }

    StackView {
        anchors {
            top: textStuff.bottom; topMargin: 75
            left: textStuff.left; leftMargin: 90
            right: textStuff.right; rightMargin: 90
            bottom: parent.bottom; bottomMargin: 45
        }
        id: stackView
        height: 300
        Component {
            id: textItem
            Text {
                id: boxText
                text: qsTr("")
            }
        }
    }
}

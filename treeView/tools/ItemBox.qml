import QtQuick 2.12

Rectangle {
    property alias item_text: itemText
    property alias mouse_area: mouseArea
    property alias height_large: heightLarge
    property alias height_small: heightSmall
    property int myIndex: 0
    id: hostItem
    width: 400
    height: 40
    radius: 5
    border {
        width: 2
        color: "black"
    }
    anchors {
        horizontalCenter: parent.horizontalCenter
    }
    color: "steelblue"
    Text {
        height: 20
        anchors {
            top: parent.top
            left: parent.left
        }
        id: itemText
        font {
            family: "Verdana"
            bold: false
            pointSize: 12
        }
        color: "black"
        font.italic: true
        leftPadding: 10
        topPadding: 10
        horizontalAlignment: Text.AlignLeft
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        states: [
            State {
                name: "mousePress"
                when: mouseArea.containsPress
                PropertyChanges {
                    target: hostItem
                    color: "white"
                }
            },
            State {
                name: "mouseHover"
                when: mouseArea.containsMouse
                PropertyChanges {
                    target: hostItem.border
                    color: "white"
                }
            }
        ]
    }
    PropertyAnimation {
        id: heightLarge;
        target: hostItem;
        property: "height";
        to: 440;
        running: false;
        duration: 200;
        easing.type: Easing.OutInQuint;
    }
    PropertyAnimation {
        id: heightSmall;
        target: hostItem;
        property: "height";
        to: 40;
        running: false;
        duration: 200;
        easing.type: Easing.OutInQuint;
    }
}



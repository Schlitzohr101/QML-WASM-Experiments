import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    property alias animate_large: animateLarge
    property alias animate_small: animateSmall
    property alias list_scroll: listScroller
    property alias list_view: list
    property int myIndex: 0
    id: nestedItem
    width: parent.width
    height: 0

    color: "white"
    border {
        color: "black"
        width: 5
    }
    radius: 5
    ScrollView {
        id: listScroller
        anchors.fill: parent
        ListView {
            id: list
            anchors.fill: parent
            model: 0
            spacing: 3
            delegate: ItemBox {
                id: itemBox
                width: parent.width

                myIndex: myIndex
                item_text.text: qsTr("Item"+(index+1))
            }
        }
    }
    PropertyAnimation {
        id: animateLarge;
        target: nestedItem;
        property: "height";
        to: 645;
        running: false;
        duration: 200;
        easing.type: Easing.OutInQuint;
    }
    PropertyAnimation {
        id: animateSmall;
        target: nestedItem;
        property: "height";
        to: 0;
        running: false;
        duration: 200;
        easing.type: Easing.OutInQuint;
    }
}

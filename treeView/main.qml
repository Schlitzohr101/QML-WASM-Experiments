import QtQuick 2.12
import QtQuick.Controls 2.5

import "tools"

ApplicationWindow {
    id: mainWin
    visible: true
    width: 640
    height: 480
    title: qsTr("Wasm Lists")

    HostList {
        id: hostRec
        anchors.centerIn: mainWin
        width: parent.width
        height: parent.height
        list_view.currentIndex: -1
        list_view.model: 20
        list_view.delegate: ItemBox {
            id: itemBox
            NestedList {
                id: nestedRec
                anchors {
                    top: itemBox.item_text.bottom; left: itemBox.left; right: itemBox.right; bottom: itemBox.bottom;
                    leftMargin: 10; topMargin: 20; bottomMargin: 10; rightMargin: 10;
                }
            }
            myIndex: index
            height_large.running: hostRec.list_view.currentIndex === itemBox.myIndex
            height_small.running: hostRec.list_view.currentIndex !== itemBox.myIndex
            item_text.text: qsTr("Item "+(index))
            mouse_area.onClicked: {
                hostRec.list_view.currentIndex =
                        hostRec.list_view.currentIndex === index ? -1 : index;
                nestedRec.list_view.model = 15;
                nestedRec.animate_large.running = true

            }

        }
    }
}

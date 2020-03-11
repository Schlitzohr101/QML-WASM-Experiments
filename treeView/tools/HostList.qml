import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    property alias list_Scroller: listScroller
    property alias list_view: list
    color: "grey"
    ScrollView {
        id: listScroller
        property int lastIndex: 0
        anchors.fill: parent
        ListView {
            id: list
            anchors.fill: parent
            spacing: 3
            property int lastClick: 0
        }
    }
}

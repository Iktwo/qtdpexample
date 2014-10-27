import QtQuick 2.3

Text {
    property string name
    property double value

    text: name + ": " + value
    width: parent.width
    elide: "ElideRight"
}

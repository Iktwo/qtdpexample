import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Window {
    property var resolutions: [
        {"height": 480, "width": 320, "name": "HVGA", "ratio": "3:2"},
        {"height": 640, "width": 360, "name": "nHD", "ratio": "16:9"},
        {"height": 640, "width": 480, "name": "VGA", "ratio": "4:3"},
        {"height": 800, "width": 480, "name": "WVGA", "ratio": "5:3"},
        {"height": 800, "width": 600, "name": "SVGA", "ratio": "4:3"},
        {"height": 960, "width": 540, "name": "qHD", "ratio": "16:9"},
        {"height": 1280, "width": 720, "name": "720p", "ratio": "16:9"},
        {"height": 1280, "width": 800, "name": "WXGA", "ratio": "16:10"},
        {"height": 1920, "width": 1080, "name": "1080p", "ratio": "16:9"}
    ]

    property int currentResolution: 1
    property int qdpi: Math.round(Screen.pixelDensity * 25.4)
    property int qldpi: Math.round(Screen.logicalPixelDensity * 25.4)
    property double qdp: (qdpi / 160).toFixed(2)
    property double qldp: (qldpi / 160).toFixed(2)
    property double dp: (dpi / 160).toFixed(2)

    width: resolutions[currentResolution]["width"]
    height: resolutions[currentResolution]["height"]

    visible: true

    ScrollView {
        anchors.fill: parent

        flickableItem.interactive: true; focus: true

        Flickable {
            anchors {
                fill: parent
                margins: 8 * dp
            }

            contentHeight: column.height

            Column {
                id: column

                width: parent.width

                spacing: 16 * dp

                ScreenValue {
                    name: "Qt's dpi"
                    value: qdpi
                }

                ScreenValue {
                    name: "Qt's logical dpi"
                    value: qldpi
                }

                ScreenValue {
                    name: "dpi"
                    value: dpi
                }

                ScreenValue {
                    name: "Qt's dp"
                    value: qdp
                }

                ScreenValue {
                    name: "Qt's logical dp"
                    value: qldp
                }

                ScreenValue {
                    name: "dp"
                    value: dp
                }

                Text {
                    text: "Hello World - 22px"
                    font.pixelSize: 22
                }

                Text {
                    text: "Hello World - 22qdp"
                    font.pixelSize: 22 * qdp
                }

                Text {
                    text: "Hello World - 22qldp"
                    font.pixelSize: 22 * qldp
                }

                Text {
                    text: "Hello World - 22po"
                    font.pointSize: 22
                }

                Text {
                    text: "Hello World - 22dp"
                    font.pixelSize: 22 * dp
                }
            }
        }
    }
}

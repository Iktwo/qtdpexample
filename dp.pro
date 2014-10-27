TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml.qrc

android {
    QT += androidextras
}

macx {
    QMAKE_MAC_SDK = macosx10.9
}

include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/src/com/iktwo/dp/Dp.java

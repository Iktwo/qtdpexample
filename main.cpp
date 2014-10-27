#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>

#ifdef Q_OS_ANDROID
#include <QAndroidJniEnvironment>
#include <QAndroidJniObject>
#endif

#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    int dpi = 0;

//#ifdef Q_OS_ANDROID
//    dpi = QAndroidJniObject::callStaticMethod<jint>("com.iktwo.dp.Dp",
//                                                      "getDpi", "()I");
//#endif

#ifdef Q_OS_ANDROID
    QAndroidJniEnvironment env;
    env->PushLocalFrame(9);

    QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative",
                                                                           "activity",
                                                                           "()Landroid/app/Activity;");
    jclass activityClass = env->GetObjectClass(activity.object<jobject>());

    jmethodID mIDGetResources = env->GetMethodID(activityClass,
                                                   "getResources",
                                                   "()Landroid/content/res/Resources;");

    jobject resources = env->CallObjectMethod(activity.object<jobject>(), mIDGetResources);
    jclass resourcesClass = env->GetObjectClass(resources);

    jmethodID mIDGetDisplayMetrics = env->GetMethodID(resourcesClass,
                                                      "getDisplayMetrics",
                                                      "()Landroid/util/DisplayMetrics;");

    jobject displayMetrics = env->CallObjectMethod(resources, mIDGetDisplayMetrics);
    jclass displayMetricsClass = env->GetObjectClass(displayMetrics);

    jfieldID fIDDensityDpi = env->GetFieldID(displayMetricsClass, "densityDpi", "I");
    jint densityDpi = env->GetIntField(displayMetrics, fIDDensityDpi);

    dpi = (int)densityDpi;

    env->PopLocalFrame(NULL);
#endif

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("dpi", dpi);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

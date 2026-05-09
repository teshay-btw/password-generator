#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Backend.h"
#include <QQmlContext>
#include <qicon.h>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN) && QT_VERSION_CHECK(5, 6, 0) <= QT_VERSION && QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/qt/qml/password-generator/icon.png"));
    QQmlApplicationEngine engine;
    Backend backend;
    engine.rootContext()->setContextProperty("backend", &backend);



    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/password-generator/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;


    QObject* root = engine.rootObjects().first();  
    backend.setRoot(root);

    return app.exec();
}

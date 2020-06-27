#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include "cplusplusqml.h"
#include <QMetaObject>
#include <QDebug>
#include <QColor>
#include <QVariant>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    QObject * rootItem = engine.rootObjects().first();
       new ChangeQmlColor(rootItem);
       QObject * quitButton = rootItem->findChild<QObject*>("quitButton");
       if(quitButton)
       {
           QObject::connect(quitButton, SIGNAL(clicked()), &app, SLOT(quit()));
       }

       QObject *textLabel = rootItem->findChild<QObject*>("textLabel");
       if(textLabel)
       {
           //1. failed call
           bool bRet = QMetaObject::invokeMethod(textLabel, "setText", Q_ARG(QString, "world hello"));
           qDebug() << "call setText return - " << bRet;
           textLabel->setProperty("color", QColor::fromRgb(255,0,0));
           bRet = QMetaObject::invokeMethod(textLabel, "doLayout");
           qDebug() << "call doLayout return - " << bRet;
       }


    return app.exec();
}

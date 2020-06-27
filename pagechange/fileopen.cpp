#include "fileopen.h"

#include <QFile>
#include <QTextStream>

FileObject::FileObject(QObject *parent) :
    QObject(parent)
{

}

QString FileObject::read()
{
    QString content;
    QFile file(m_source);
    if ( file.open(QIODevice::ReadOnly) ) {
        content = file.readAll();
        file.close();
    }

    return content;
}

bool FileObject::write(const QString& data)
{
    QFile file(m_source);
    if ( file.open(QFile::WriteOnly | QFile::Truncate) ) {
        QTextStream out(&file);
        out<<data;
        file.close();
        return true;
    }
    else {
        return false;
    }
}

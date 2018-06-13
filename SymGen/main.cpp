/** SymGen
* Generates .sym files for use with Breakpad and puts them in the correct folders
*
* @author The Jimmytaker
* @date 13.06.2018
* @copyright pro-micron GmbH & Co. KG
*/
#include <QCoreApplication>
#include <QDebug>
#include <QDir>
#include <QProcess>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    if (argc != 3) {
        qDebug() << "Usage: SymGen <in - binary files path> <out - folder where .sym files go>";
        return EXIT_FAILURE;
    }
    QDir di(argv[1], QStringLiteral("*.pdb"), QDir::Name, QDir::Files);
    if (di.isEmpty()) {
        qDebug() << argv[1] << "does not contain any files to extract symbols from.";
        return EXIT_FAILURE;
    }
    if (QDir(qApp->applicationDirPath(), QStringLiteral("dump_syms*"), QDir::Name, QDir::Files)
            .isEmpty()) {
        qDebug() << "dump_syms not found! Make sure it is in path!";
        return EXIT_FAILURE;
    }
    QDir ds(QStringLiteral("/symbols").prepend(argv[2]));
    if (!ds.mkpath(ds.absolutePath())) {
        qDebug() << ds.absolutePath() << "could not be created!";
        return EXIT_FAILURE;
    }
    QProcess p;
    foreach(auto f, di.entryInfoList()) {
        p.start(qApp->applicationDirPath() + "/dump_syms " + f.absoluteFilePath());
        p.waitForFinished(99999);
        auto ba = p.readAll();
        auto l = ba.left(ba.indexOf('\n')).split(' '); //the dir is in the first line
        if (l.size() < 2) {
            qDebug() << "Could not dump symbols for" << f.absoluteFilePath();
            continue;
        }
        QString sPath = ds.absolutePath() + "/" + f.fileName() + "/" + l.at(l.size() - 2);
        if (ds.mkpath(sPath)) {
            QFile fs(sPath + "/" + f.completeBaseName() + ".sym");
            fs.open(QFile::WriteOnly);
            fs.write(ba);
        }
        else qDebug() << sPath << "could not be created!";
    }
    return EXIT_SUCCESS;
}

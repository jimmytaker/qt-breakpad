include(qtbreakpad-client.pri)

CONFIG += staticlib

TEMPLATE = lib
QT -= gui

CONFIG(debug, debug|release) {
     TARGET = $$join(TARGET,,,d)
}

## breakpad needs debug info inside binaries

win32-msvc* {
    # generate the symbol file
    QMAKE_LFLAGS_RELEASE += /MAP /debug /opt:ref
    QMAKE_CFLAGS_RELEASE += -Zi
    QMAKE_CXXFLAGS_RELEASE += -Zi
}

linux:QMAKE_CFLAGS += -g
linux:QMAKE_CXXFLAGS += -g

# prevent undue optimization, which ruins breakpad's backtrace
QMAKE_CFLAGS_RELEASE -= -O
QMAKE_CFLAGS_RELEASE -= -O1
QMAKE_CFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE -= -O
QMAKE_CXXFLAGS_RELEASE -= -O1
QMAKE_CXXFLAGS_RELEASE -= -O2

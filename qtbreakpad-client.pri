HEADERS += $$PWD/qt_breakpad.h
SOURCES += $$PWD/qt_breakpad.cpp

INCLUDEPATH += $$PWD
INCLUDEPATH += $$PWD/vendor/breakpad/src

SOURCES += \
    $$PWD/vendor/breakpad/src/common/string_conversion.cc \
    $$PWD/vendor/breakpad/src/common/convert_UTF.c \
    $$PWD/vendor/breakpad/src/common/md5.cc

linux:SOURCES += \
    $$PWD/vendor/breakpad/src/client/minidump_file_writer.cc \
    $$PWD/vendor/breakpad/src/client/linux/log/log.cc \
    $$PWD/vendor/breakpad/src/client/linux/handler/exception_handler.cc \
    $$PWD/vendor/breakpad/src/client/linux/handler/minidump_descriptor.cc \
    $$PWD/vendor/breakpad/src/common/linux/guid_creator.cc \
    $$PWD/vendor/breakpad/src/client/linux/dump_writer_common/thread_info.cc \
    $$PWD/vendor/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc \
    $$PWD/vendor/breakpad/src/client/linux/minidump_writer/linux_dumper.cc \
    $$PWD/vendor/breakpad/src/client/linux/minidump_writer/minidump_writer.cc \
    $$PWD/vendor/breakpad/src/client/linux/minidump_writer/linux_ptrace_dumper.cc \
    $$PWD/vendor/breakpad/src/client/linux/microdump_writer/microdump_writer.cc \
    $$PWD/vendor/breakpad/src/common/linux/file_id.cc \
    $$PWD/vendor/breakpad/src/common/linux/elfutils.cc \
    $$PWD/vendor/breakpad/src/common/linux/linux_libc_support.cc \
    $$PWD/vendor/breakpad/src/common/linux/memory_mapped_file.cc \
    $$PWD/vendor/breakpad/src/common/linux/safe_readlink.cc \
    $$PWD/vendor/breakpad/src/client/linux/crash_generation/crash_generation_client.cc

win32:SOURCES += \
    $$PWD/vendor/breakpad/src/common/windows/guid_string.cc \
    $$PWD/vendor/breakpad/src/client/windows/handler/exception_handler.cc \
    $$PWD/vendor/breakpad/src/client/windows/crash_generation/minidump_generator.cc \
    $$PWD/vendor/breakpad/src/client/windows/crash_generation/client_info.cc \
    $$PWD/vendor/breakpad/src/client/windows/crash_generation/crash_generation_client.cc

macos {
    SOURCES +=  \
        $$PWD/vendor/breakpad/src/client/minidump_file_writer.cc \
        $$PWD/vendor/breakpad/src/client/mac/crash_generation/crash_generation_client.cc \
        $$PWD/vendor/breakpad/src/client/mac/handler/exception_handler.cc \
        $$PWD/vendor/breakpad/src/client/mac/handler/minidump_generator.cc \
        $$PWD/vendor/breakpad/src/client/mac/handler/breakpad_nlist_64.cc \
        $$PWD/vendor/breakpad/src/client/mac/handler/dynamic_images.cc \
        $$PWD/vendor/breakpad/src/client/mac/handler/protected_memory_allocator.cc \
        $$PWD/vendor/breakpad/src/common/mac/bootstrap_compat.cc \
        $$PWD/vendor/breakpad/src/common/mac/file_id.cc \
        $$PWD/vendor/breakpad/src/common/mac/macho_id.cc \
        $$PWD/vendor/breakpad/src/common/mac/macho_reader.cc \
        $$PWD/vendor/breakpad/src/common/mac/macho_utilities.cc \
        $$PWD/vendor/breakpad/src/common/mac/macho_walker.cc \
        $$PWD/vendor/breakpad/src/common/mac/string_utilities.cc
    OBJECTIVE_SOURCES += \
        $$PWD/vendor/breakpad/src/common/mac/MachIPC.mm
    LIBS += -framework Foundation
}

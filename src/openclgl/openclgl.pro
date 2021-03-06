TEMPLATE = lib
TARGET = QtOpenCLGL
QT += opengl
gcov {
    CONFIG += staticlib
} else {
    CONFIG += dll
}
CONFIG += warn_on debug_and_release
win32 { 
    DESTDIR = ../../bin
    !static:DEFINES += QT_MAKEDLL
}
else:DESTDIR = ../../lib

build_pass:CONFIG(debug, debug|release) {
    unix {
        TARGET = $$join(TARGET,,,_debug)
		LIBS += -lQtOpenCL_debug
    }
    else {
        TARGET = $$join(TARGET,,,d)
		LIBS += -lQtOpenCLd
    }
} else {
	LIBS += -lQtOpenCL
}

LIBS += -L../../lib -L../../bin
win32 {
    !isEmpty(QMAKE_INCDIR_OPENCL) {
        INCLUDEPATH += $$quote($$QMAKE_INCDIR_OPENCL)
    }
    !isEmpty(QMAKE_LIBDIR_OPENCL) {
        LIBS += -L$$quote($$QMAKE_LIBDIR_OPENCL)
    }
    !isEmpty(QMAKE_LIBS_OPENCL) {
        LIBS += $$QMAKE_LIBS_OPENCL
    } else {
        LIBS += -lOpenCL
    }
}

no_cl_gl {
    DEFINES += QT_NO_CL_OPENGL
}

INCLUDEPATH += $$PWD/../opencl

HEADERS += \
    qclcontextgl.h

SOURCES += \
    qclcontextgl.cpp

PRIVATE_HEADERS += \
    qcl_gl_p.h

HEADERS += $$PRIVATE_HEADERS
DEFINES += QT_BUILD_CLGL_LIB

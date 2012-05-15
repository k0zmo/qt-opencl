INCLUDEPATH += $$PWD $$PWD/../opencl
LIBS += -lQtOpenCLGL -lQtOpenCL

QTOPENCLGL_LIBS = -lQtOpenCLGL -lQtOpenCL

build_pass:CONFIG(debug, debug|release) {
    unix: QTOPENCLGL_LIBS = $$join(QTOPENCLGL_LIBS,,,_debug)
    else: QTOPENCLGL_LIBS = $$join(QTOPENCLGL_LIBS,,,d)
}

LIBS += $$QTOPENCLGL_LIBS

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
QT += opengl
no_cl_gl {
    DEFINES += QT_NO_CL_OPENGL
}

INCLUDEPATH += $$PWD
LIBS += -lQtOpenCL
macx:!opencl_configure {
    LIBS += -framework OpenCL
}
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

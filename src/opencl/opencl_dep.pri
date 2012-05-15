INCLUDEPATH += $$PWD

QTOPENCL_LIB = -lQtOpenCL

build_pass:CONFIG(debug, debug|release) {
    unix: QTOPENCL_LIB = $$join(QTOPENCL_LIB,,,_debug)
    else: QTOPENCL_LIB = $$join(QTOPENCL_LIB,,,d)
}

LIBS += $$QTOPENCL_LIB

win32 {
    !isEmpty(QMAKE_INCDIR_OPENCL) {
        INCLUDEPATH += $$quote($$QMAKE_INCDIR_OPENCL)
    }
    !isEmpty(QMAKE_LIBDIR_OPENCL) {
        LIBS += -L$$quote($$QMAKE_LIBDIR_OPENCL)
    }
}

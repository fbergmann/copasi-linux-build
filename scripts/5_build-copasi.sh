#!/bin/env bash

EXTRA_ARGS=
# if uic executable exists, use it, otherwise use the one from the system
if [ -f "$QTDIR/libexec/uic" ]; then
    EXTRA_ARGS="-DQt6Widgets_UIC_EXECUTABLE=$QTDIR/libexec/uic"
fi

if [ "$QT_VERSION" == "system" ]; then
    EXTRA_ARGS="-DQt6Widgets_UIC_EXECUTABLE=/usr/lib/qt6/libexec/uic"
fi

cmake -G Ninja -B build-copasi -S COPASI -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_INSTALL_PREFIX=install-copasi -DSELECT_QT=Qt6 -DQt6_DIR=$Qt6_DIR -DCOPASI_DEPENDENCY_DIR=install-dependencies -DWITH_DATAVISUALIZATION_NAMESPACES=OFF $EXTRA_ARGS
cmake --build build-copasi
cmake --install build-copasi

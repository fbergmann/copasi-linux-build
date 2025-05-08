cmake -G Ninja -B build-copasi -S COPASI -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_INSTALL_PREFIX=install-copasi -DSELECT_QT=Qt6 -DQt6_DIR=$Qt6_DIR -DCOPASI_DEPENDENCY_DIR=install-dependencies -DQt6Widgets_UIC_EXECUTABLE=$QTDIR/libexec/uic -DWITH_DATAVISUALIZATION_NAMESPACES=OFF
cmake --build build-copasi
cmake --install build-copasi

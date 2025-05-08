pushd copasi-dependencies/src/libuuid-1.0.3
aclocal && libtoolize --force && automake --add-missing && autoreconf --force --install
make distclean
popd

cmake -G Ninja -B build-dependencies -S copasi-dependencies -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_INSTALL_PREFIX=install-dependencies -DSELECT_QT=Qt6 -DQt6_DIR=$Qt6_DIR -DBUILD_uuid=ON



cmake --build build-dependencies --target Libuuid
cmake --build build-dependencies 
cmake --install build-dependencies

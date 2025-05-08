#!/bin/env bash

# copy the needed shared libraries that install-copasi/bin/CopasiUI needs and are present in $QTDIR/lib, using ldd
# Get list of Qt libraries needed by CopasiUI
export LD_LIBRARY_PATH=$QTDIR/lib
mkdir -p install-copasi/lib
ldd install-copasi/bin/CopasiUI | grep "$QTDIR/lib" | while read -r line; do
    # Extract the library path
    lib_path=$(echo "$line" | awk '{print $3}')
    # Extract just the filename
    lib_name=$(basename "$lib_path")
    # Copy the library to install-copasi/lib
    cp "$lib_path" install-copasi/lib/
done

# correct the rpath of the shared libraries
# Only run patchelf on ELF files
for file in install-copasi/bin/*; do
    if file "$file" | grep -q "ELF"; then
        patchelf --set-rpath '$ORIGIN' "$file"
    fi
done



# if linuxdeployqt exists, use it, otherwise install it
if [ ! -f "./linuxdeployqt/AppRun" ]; then
    wget -c "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
    chmod +x linuxdeployqt-continuous-x86_64.AppImage
    ./linuxdeployqt-continuous-x86_64.AppImage --appimage-extract
    mv squashfs-root linuxdeployqt
fi

./linuxdeployqt/AppRun install-copasi/bin/CopasiUI -ignore-glob=sqldrivers,printsupport,wayland-shell-integration,wayl,gtk -bundle-non-qt-libs -exclude-libs=libsycl_ur_trace_collector,libtbbbind,libtbbmalloc_proxy,libtbbbind_debug,libtbbmalloc_proxy_debug,libur_loader,libur_adapter_level_zero,libur_adapter_opencl,libarcher,libomptarget,libQt6WaylandClient,libQt6WaylandEglClientHwIntegration,libQt6WlShellIntegration,libQt6ShaderTools,libqtgraphicaleffectsprivateplugin,libwaylandtexturesharingplugin,libqwayland-egl,libqwayland-generic,libadwaita,libbradient,libdmabuf-server,libdrm-egl-server,libqt-plugin-wayland-egl,libshm-emulation-server,libvulkan-server,libfullscreen-shell-v1,libivi-shell,libqt-shell,libwl-shell-plugin,wayland-shell-integration,libxdg-shell,libqgtk3,libcupsprintersupport,libqsqlmimer,libqsqlmysql,libqsqlodbc,libqsqlpsql


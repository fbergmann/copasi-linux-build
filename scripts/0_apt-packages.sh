#!/bin/env bash

apt update
# Prevent interactive prompts
export DEBIAN_FRONTEND=noninteractive

apt install -y -qq \
    python3 python3-venv git \
    build-essential clang libglib2.0-0  libgl1-mesa-dev libglu1-mesa-dev autoconf automake libtool  wget astyle gawk \
    libdbus-1-dev libxkbcommon-dev libhwloc15 libxcb-cursor0 libxcb-icccm4  libxcb-keysyms1 libxcb-shape0 libxcb-xkb1 \
    libxkbcommon-x11-0 patchelf


if [ "$QT_VERSION" == "system" ]; then
    apt install -y -qq \
        qt6-base-dev qt6-tools-dev libqt6datavisualization6-dev libqt6core5compat6-dev libqt6charts6-dev libqt6svg6-dev  qt6-declarative-dev  qt6-tools

        
fi

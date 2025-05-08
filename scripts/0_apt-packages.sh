#!/bin/env bash

apt update
# Prevent interactive prompts
export DEBIAN_FRONTEND=noninteractive

apt install -y -qq \
    python3 python3-venv git \
    build-essential clang libglib2.0-0  libgl1-mesa-dev libglu1-mesa-dev autoconf automake libtool  wget astyle gawk \
    libdbus-1-dev libxkbcommon-dev libhwloc15 libxcb-cursor0 libxcb-icccm4  libxcb-keysyms1 libxcb-shape0 libxcb-xkb1 \
    libxkbcommon-x11-0 patchelf
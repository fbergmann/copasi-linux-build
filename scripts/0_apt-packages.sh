apt update
# Prevent interactive prompts
export DEBIAN_FRONTEND=noninteractive

apt install -y -qq \
    python3 python3-venv git \
    build-essential clang libglib2.0-0  libgl1-mesa-dev libglu1-mesa-dev autoconf automake libtool  wget astyle gawk \
    libdbus-1-dev libxkbcommon-dev
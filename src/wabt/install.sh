#!/bin/bash
set -e

echo "Activating feature 'The WebAssembly Binary Toolkit'"

# Get cmake
cd ~
curl -Lo ~/cmake.sh https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-x86_64.sh
chmod +x ~/cmake.sh

sudo mkdir /usr/local/bin/cmake
./cmake.sh --skip-license --prefix=/usr/local/bin/cmake
export PATH="${PATH}:/usr/local/bin/cmake/bin"
rm ~/cmake.sh

# Clone and build wabt
git clone https://github.com/WebAssembly/wabt.git
cd wabt
git submodule update --init

mkdir build
cd build
cmake ..
cmake --build .

cd ..
sudo mkdir /usr/local/bin/wabt
sudo mv build/ /usr/local/bin/wabt/bin
export PATH=$PATH:/usr/local/bin/wabt/bin

cd ..
rm -rf wabt/
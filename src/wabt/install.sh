#!/bin/bash
set -e

echo "Activating feature 'The WebAssembly Binary Toolkit'"

# Get cmake
cd ~
sudo curl -Lo ~/cmake.sh https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-x86_64.sh
sudo chmod +x ~/cmake.sh

sudo mkdir /usr/local/bin/cmake
./cmake.sh --skip-license --prefix=/usr/local/bin/cmake
export PATH="${PATH}:/usr/local/bin/cmake/bin"
rm ~/cmake.sh

# Clone and build wabt
sudo git clone https://github.com/WebAssembly/wabt.git
sudo cd wabt
sudo git submodule update --init

sudo mkdir build
sudo cd build
sudo cmake ..
sudo cmake --build .

sudo cd ..
sudo mkdir /usr/local/bin/wabt
sudo mv build/ /usr/local/bin/wabt/bin

sudo cd ..
sudo rm -rf wabt/

export PATH="${PATH}:/usr/local/bin/wabt/bin"
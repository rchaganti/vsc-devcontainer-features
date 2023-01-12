#!/bin/bash
set -e

echo "Activating feature 'Tiny Go'"

# Azure Bicep CLI version 
VERSION=${VERSION:-"latest"}
ARCHITECTURE="amd64"

if [ "$(dpkg --print-architecture)" ==  "arm64" ]; then
    ARCHITECTURE="arm64"
fi

TINYURL="https://github.com/tinygo-org/tinygo/releases/download/v${VERSION}/tinygo_${VERSION}_${ARCHITECTURE}.deb"

sudo curl -Lo /usr/local/bin/bicep ${TINYURL}
sudo dpkg -i tinygo_${VERSION}_${ARCHITECTURE}.deb

export PATH=$PATH:/usr/local/bin

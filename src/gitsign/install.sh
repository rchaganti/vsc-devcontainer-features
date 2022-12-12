#!/bin/bash
set -e

echo "Activating feature 'gitsign'"

# Azure Bicep CLI version 
VERSION=${VERSION:-"latest"}
ARCHITECTURE="amd64"

if [ "$(dpkg --print-architecture)" ==  "arm64" ]; then
    ARCHITECTURE="arm64"
fi

GITSIGNURL="https://github.com/sigstore/gitsign/releases/latest/download/gitsign_${VERSION}_linux_${ARCHITECTURE}"

sudo curl -Lo /usr/local/bin/gitsign ${GITSIGNURL}
sudo chmod +x /usr/local/bin/gitsign

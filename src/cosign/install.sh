#!/bin/bash
set -e

echo "Activating feature 'Cosign'"

# Azure Bicep CLI version 
VERSION=${VERSION:-"latest"}
ARCHITECTURE="amd64"

if [ "$(dpkg --print-architecture)" ==  "arm64" ]; then
    ARCHITECTURE="arm64"
fi

if [ "${VERSION}" = "latest" ]; then
    COSIGNURL="https://github.com/sigstore/cosign/releases/latest/download/cosign-linux-${ARCHITECTURE}"
else
    COSIGNURL="https://github.com/sigstore/cosign/releases/download/v${VERSION}/cosign-linux-${ARCHITECTURE}"
fi

sudo curl -Lo /usr/local/bin/cosign ${COSIGNURL}
sudo chmod +x /usr/local/bin/cosign

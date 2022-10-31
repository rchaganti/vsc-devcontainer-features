#!/bin/bash
set -e

echo "Activating feature 'Azure Bicep'"

# Azure Bicep CLI version 
VERSION=${VERSION:-"latest"}
ARCHITECTURE="x64"

if [ "$(dpkg --print-architecture)" ==  "arm64" ]; then
    ARCHITECTURE="arm64"
fi

if [ "${VERSION}" = "latest" ]; then        
    CLIURL="https://github.com/Azure/bicep/releases/latest/download/bicep-linux-${ARCHITECTURE}"
else
    CLIURL="https://github.com/Azure/bicep/releases/download/${VERSION}/bicep-linux-${ARCHITECTURE}"
fi

sudo curl -Lo /usr/local/bin/bicep ${CLIURL}
sudo chmod +x /usr/local/bin/bicep

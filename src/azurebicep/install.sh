#!/bin/bash
set -e

set -a
. ./devcontainer-features.env
set +a

echo "Activating feature 'Azure Bicep'"

# Azure Bicep CLI version 
VERSION=${VERSION:-"latest"}

if [ "${VERSION}" = "latest" ]; then        
    CLIURL="https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64"
else
    CLIURL="https://github.com/Azure/bicep/releases/download/${VERSION}/bicep-linux-x64"
fi

sudo curl -Lo /usr/local/bin/bicep ${CLIURL}
sudo chmod +x /usr/local/bin/bicep

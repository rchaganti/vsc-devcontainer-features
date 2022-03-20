#!/bin/bash
set -e

set -a
. ./devcontainer-features.env
set +a


if [ ! -z ${_BUILD_ARG_AZUREBICEP} ]; then
    echo "Activating feature 'Azure Bicep'"

    # Azure Bicep CLI version 
    CLIVERSION=${_BUILD_ARG_AZUREBICEP_CLI:-"latest"}

    if [ "${CLIVERSION}" = "latest" ]; then        
        CLIURL="https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64"
    else
        CLIURL="https://github.com/Azure/bicep/releases/download/${CLIVERSION}/bicep-linux-x64"
    fi

    # Azure Bicep VS Code extension version 
    EXTNVERSION=${_BUILD_ARG_AZUREBICEP_EXTENSION:-"latest"}

    if [ "${EXTNVERSION}" = "latest" ]; then        
        EXTNURL="https://github.com/Azure/bicep/releases/latest/download/vscode-bicep.vsix"
    else
        EXTNURL="https://github.com/Azure/bicep/releases/download/${EXTNURL}/vscode-bicep.vsix"
    fi

    sudo tee /usr/installbicep.sh > /dev/null \
    << EOF
    sudo curl -Lo /usr/local/bin/bicep ${CLIURL}
    sudo chmod +x /usr/local/bin/bicep

    sudo curl -Lo /tmp/vscode-bicep.vsix ${EXTNURL}
    sudo code --install-extension /tmp/vscode-bicep.vsix
EOF
    sudo chmod +x /usr/installbicep.sh
fi
#!/bin/bash
set -e

set -a
. ./devcontainer-features.env
set +a

if [ ! -z ${_BUILD_ARG_AZUREBICEP} ]; then
    echo "Activating feature 'Azure Bicep'"

    # Azure Bicep CLI version 
    CLIVERSION=${_BUILD_ARG_AZUREBICEP_VERSION:-"latest"}

    if [ "${CLIVERSION}" = "latest" ]; then        
        CLIURL="https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64"
    else
        CLIURL="https://github.com/Azure/bicep/releases/download/${CLIVERSION}/bicep-linux-x64"
    fi

    sudo tee /usr/installbicep.sh > /dev/null \
    << EOF
    sudo curl -Lo /usr/local/bin/bicep ${CLIURL}
    sudo chmod +x /usr/local/bin/bicep
EOF
    sudo chmod +x /usr/installbicep.sh
fi

if [ ! -z ${_BUILD_ARG_CUELANG} ]; then
    echo "Activating feature 'CUELANG'"

    # CUE lang version
    CUEVERSION=${_BUILD_ARG_CUELANG_VERSION:-"latest"}

    CUEURL="https://github.com/cue-lang/cue/releases/download/v${CUEVERSION}/cue_v${CUEVERSION}_linux_amd64.tar.gz"

    sudo tee /usr/installcue.sh > /dev/null \
    << EOF
    sudo curl -Lo /tmp/cue.tar.gz ${CUEURL}
    sudo tar xvzf /tmp/cue.tar.gz -C /tmp/cue
    sudo cp /tmp/cue/cue /usr/local/bin/cue 
    sudo chmod +x /usr/local/bin/cue
EOF
    sudo chmod +x /usr/installcue.sh
fi
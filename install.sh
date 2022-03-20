#!/bin/bash
set -e

set -a
. ./devcontainer-features.env
set +a


if [ ! -z ${_BUILD_ARG_AZUREBICEP} ]; then
    echo "Activating feature 'Azure Bicep'"

    # Build args are exposed to this entire feature set following the pattern:  _BUILD_ARG_<FEATURE ID>_<OPTION NAME>
    VERSION=${_BUILD_ARG_AZUREBICEP_VERSION:-"latest"}

    if [ "${VERSION}" = "latest" ]; then        
        URL="https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64"
    else
        URL="https://github.com/Azure/bicep/releases/download/${VERSION}/bicep-linux-x64"
    fi

    sudo tee /usr/installbicep.sh > /dev/null \
    << EOF
    sudo curl -Lo /usr/local/bin/bicep ${URL}
    sudo chmod +x /usr/local/bin/bicep
EOF
    sudo chmod +x /usr/installbicep.sh
fi
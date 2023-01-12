#!/bin/bash
set -e

echo "Activating feature 'The WebAssembly Binary Toolkit'"

# Azure Bicep CLI version 
VERSION=${VERSION:-"latest"}

LOCALFILE="/tmp/wabt.tar.gz"
WABTURL="https://github.com/WebAssembly/wabt/releases/download/${VERSION}/wabt-${VERSION}-ubuntu.tar.gz"

sudo curl -Lo ${LOCALFILE} ${WABTURL}
sudo tar -xvf ${LOCALFILE} --directory /usr/local/bin/
export PATH="${PATH}:/usr/local/bin/wabt-${VERSION}"

sudo rm  ${LOCALFILE}

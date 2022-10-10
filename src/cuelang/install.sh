#!/bin/bash
set -e

echo "Activating feature 'CUELANG'"

# CUE lang version
VERSION=${VERSION:-"latest"}

CUEURL="https://github.com/cue-lang/cue/releases/download/v${VERSION}/cue_v${VERSION}_linux_amd64.tar.gz"

sudo curl -Lo /tmp/cue.tar.gz ${CUEURL}
sudo mkdir /tmp/cue
sudo tar xvzf /tmp/cue.tar.gz -C /tmp/cue
sudo cp /tmp/cue/cue /usr/local/bin/cue 
sudo chmod +x /usr/local/bin/cue
sudo rm -rf /tmp/cue
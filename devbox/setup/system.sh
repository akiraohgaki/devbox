#!/bin/bash

#sudo apt update
#DEBIAN_FRONTEND=noninteractive sudo apt install -y --no-install-recommends \
#package-name
#sudo apt clean
#sudo rm -rf /var/lib/apt/lists/*

ARCH="$(uname -m)"

CODE_CLI_OS='cli-alpine-x64'
OPENVSCODE_SERVER_PLATFORM='linux-x64'

if [ "${ARCH}" = 'aarch64' ] || [ "${ARCH}" = 'arm64' ]; then
  CODE_CLI_OS='cli-alpine-arm64'
  OPENVSCODE_SERVER_PLATFORM='linux-arm64'
fi

curl -fsSL "https://code.visualstudio.com/sha/download?build=stable&os=${CODE_CLI_OS}" | sudo tar -C /usr/local/bin -xzf - code
sudo chmod 755 /usr/local/bin/code

OPENVSCODE_SERVER_TAG="$(curl -fsSL https://api.github.com/repos/gitpod-io/openvscode-server/releases/latest | jq -r '.tag_name')"
curl -fsSL "https://github.com/gitpod-io/openvscode-server/releases/download/${OPENVSCODE_SERVER_TAG}/${OPENVSCODE_SERVER_TAG}-${OPENVSCODE_SERVER_PLATFORM}.tar.gz" | sudo tar -C /opt -xzf -
sudo chmod 755 "/opt/${OPENVSCODE_SERVER_TAG}-${OPENVSCODE_SERVER_PLATFORM}/bin/openvscode-server"
sudo ln -s "/opt/${OPENVSCODE_SERVER_TAG}-${OPENVSCODE_SERVER_PLATFORM}/bin/openvscode-server" /usr/local/bin/openvscode-server

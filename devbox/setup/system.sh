#!/bin/bash

#sudo apt update
#DEBIAN_FRONTEND=noninteractive sudo apt install -y --no-install-recommends \
#  default-jre \
#  default-jdk \
#  maven \
#  gradle
#sudo apt clean
#sudo rm -rf /var/lib/apt/lists/*

ARCH="$(uname -m)"

CODE_CLI_OS='cli-alpine-x64'

if [ "${ARCH}" = 'aarch64' ] || [ "${ARCH}" = 'arm64' ]; then
  CODE_CLI_OS='cli-alpine-arm64'
fi

curl -fsSL "https://code.visualstudio.com/sha/download?build=stable&os=${CODE_CLI_OS}" | sudo tar -C /usr/local/bin -xzf - code
sudo chmod 755 /usr/local/bin/code

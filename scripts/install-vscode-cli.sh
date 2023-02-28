#!/bin/bash

ARCH="$(uname -m)"
OS='cli-alpine-x64'

if [ "${ARCH}" = 'aarch64' ] || [ "${ARCH}" = 'arm64' ]; then
  OS='cli-alpine-arm64'
fi

curl -fsSL "https://code.visualstudio.com/sha/download?build=stable&os=${OS}" | tar -C /usr/local/bin -xzf - code
chmod 755 /usr/local/bin/code

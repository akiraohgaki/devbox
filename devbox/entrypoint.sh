#!/bin/bash

if [ ! -f /usr/local/etc/devbox/setup-done ]; then
  bash /devbox/setup/system-default.sh
  bash /devbox/setup/system-addition.sh

  sudo mkdir -p /usr/local/etc/devbox
  sudo touch /usr/local/etc/devbox/setup-done
fi

if [ ! -f "${HOME}/.local/etc/devbox/setup-done" ]; then
  bash /devbox/setup/user-default.sh
  bash /devbox/setup/user-addition.sh

  cp /devbox/README-devbox.md "${HOME}/README-devbox.md"

  mkdir -p "${HOME}/.local/etc/devbox"
  touch "${HOME}/.local/etc/devbox/setup-done"
fi

if [ ${#} = 0 ]; then
  exit 1
fi

exec "${@}"

#!/bin/bash

if [ ${#} = 0 ]; then
  exit 1
fi

if [ ! -f /usr/local/etc/devbox/setup-done ]; then
  if [ -f /devbox/setup/system.sh ]; then
    bash /devbox/setup/system.sh
  fi

  if [ -f /devbox/setup-additions/system.sh ]; then
    bash /devbox/setup-additions/system.sh
  fi

  sudo mkdir -p /usr/local/etc/devbox
  sudo touch /usr/local/etc/devbox/setup-done
fi

if [ ! -f "${HOME}/.local/etc/devbox/setup-done" ]; then
  if [ -f /devbox/setup/user.sh ]; then
    bash /devbox/setup/user.sh
  fi

  if [ -f /devbox/setup-additions/user.sh ]; then
    bash /devbox/setup-additions/user.sh
  fi

  mkdir -p "${HOME}/.local/etc/devbox"
  touch "${HOME}/.local/etc/devbox/setup-done"
fi

exec "${@}"

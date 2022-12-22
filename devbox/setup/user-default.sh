#!/bin/bash

CONFIGS_BASE_URL='https://raw.githubusercontent.com/akiraohgaki/configs/main'
INSTALL_PREFIX="${HOME}/.local"
ENV_FILE="${HOME}/.devboxenv"

touch "${ENV_FILE}"

curl -fsSL https://sh.rustup.rs | RUSTUP_HOME="${INSTALL_PREFIX}" CARGO_HOME="${INSTALL_PREFIX}" sh -s -- --no-modify-path -y
echo "export RUSTUP_HOME=${INSTALL_PREFIX}" >>"${ENV_FILE}"
echo "export CARGO_HOME=${INSTALL_PREFIX}" >>"${ENV_FILE}"

curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL="${INSTALL_PREFIX}" sh -s --
echo "export DENO_INSTALL=${INSTALL_PREFIX}" >>"${ENV_FILE}"

curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n -o "${INSTALL_PREFIX}/bin/n" --create-dirs
chmod 755 "${INSTALL_PREFIX}/bin/n"
echo "export N_PREFIX=${INSTALL_PREFIX}" >>"${ENV_FILE}"
N_PREFIX="${INSTALL_PREFIX}" "${INSTALL_PREFIX}/bin/n" lts

ssh-keygen -t ed25519 -N '' -f "${HOME}/.ssh/id_ed25519"
ssh-keygen -t rsa -N '' -f "${HOME}/.ssh/id_rsa"
curl -fsSL "${CONFIGS_BASE_URL}/ssh/config" -o "${HOME}/.ssh/config"

curl -fsSL "${CONFIGS_BASE_URL}/zsh/.zshrc" -o "${HOME}/.zshrc"

curl -fsSL "${CONFIGS_BASE_URL}/git/.gitconfig" -o "${HOME}/.gitconfig"
curl -fsSL "${CONFIGS_BASE_URL}/git/.gitignore" -o "${HOME}/.gitignore"

curl -fsSL "${CONFIGS_BASE_URL}/editorconfig/.editorconfig" -o "${HOME}/.editorconfig"

curl -fsSL "${CONFIGS_BASE_URL}/vim/.vimrc" -o "${HOME}/.vimrc"

curl -fsSL "${CONFIGS_BASE_URL}/vscode/settings.json" -o "${HOME}/.vscode-server/data/Machine/settings.json" --create-dirs
curl -fsSL "${CONFIGS_BASE_URL}/vscode/settings.json" -o "${HOME}/.vscode-remote/data/Machine/settings.json" --create-dirs
curl -fsSL "${CONFIGS_BASE_URL}/vscode/extensions.json" -o "${HOME}/Projects/.vscode/extensions.json" --create-dirs

echo '' >>"${HOME}/.bashrc"
echo "source ${ENV_FILE}" >>"${HOME}/.bashrc"

echo '' >>"${HOME}/.zshrc"
echo "source ${ENV_FILE}" >>"${HOME}/.zshrc"

#!/bin/bash

CONFIGS_BASE_URL='https://raw.githubusercontent.com/akiraohgaki/configs/main'
INSTALL_PREFIX="${HOME}/.local"
ENV_FILE="${HOME}/.localenv"

touch "${ENV_FILE}"

curl -fsSL https://sh.rustup.rs | RUSTUP_HOME="${INSTALL_PREFIX}" CARGO_HOME="${INSTALL_PREFIX}" sh -s -- -y --no-modify-path
echo "export RUSTUP_HOME=${INSTALL_PREFIX}" >>"${ENV_FILE}"
echo "export CARGO_HOME=${INSTALL_PREFIX}" >>"${ENV_FILE}"

curl -fsSL https://deno.land/install.sh | DENO_INSTALL="${INSTALL_PREFIX}" sh -s -- -y --no-modify-path
echo "export DENO_INSTALL=${INSTALL_PREFIX}" >>"${ENV_FILE}"
DENO_INSTALL="${INSTALL_PREFIX}" "${INSTALL_PREFIX}/bin/deno" x --install-alias

curl -fsSL -o "${INSTALL_PREFIX}/bin/n" --create-dirs https://raw.githubusercontent.com/tj/n/master/bin/n
chmod 755 "${INSTALL_PREFIX}/bin/n"
echo "export N_PREFIX=${INSTALL_PREFIX}" >>"${ENV_FILE}"
N_PREFIX="${INSTALL_PREFIX}" "${INSTALL_PREFIX}/bin/n" lts

ssh-keygen -t ed25519 -N '' -f "${HOME}/.ssh/id_ed25519"
ssh-keygen -t rsa -N '' -f "${HOME}/.ssh/id_rsa"
curl -fsSL -o "${HOME}/.ssh/config" "${CONFIGS_BASE_URL}/ssh/config"

curl -fsSL -o "${HOME}/.zshrc" "${CONFIGS_BASE_URL}/zsh/.zshrc"

curl -fsSL -o "${HOME}/.gitconfig" "${CONFIGS_BASE_URL}/git/.gitconfig"
curl -fsSL -o "${HOME}/.gitignore" "${CONFIGS_BASE_URL}/git/.gitignore"

curl -fsSL -o "${HOME}/.editorconfig" "${CONFIGS_BASE_URL}/editorconfig/.editorconfig"

curl -fsSL -o "${HOME}/.vimrc" "${CONFIGS_BASE_URL}/vim/.vimrc"

curl -fsSL -o "${HOME}/.vscode-remote/data/Machine/settings.json" --create-dirs "${CONFIGS_BASE_URL}/vscode/settings.json"
curl -fsSL -o "${HOME}/.vscode-server/data/Machine/settings.json" --create-dirs "${CONFIGS_BASE_URL}/vscode/settings.json"
curl -fsSL -o "${HOME}/workspaces/.vscode/extensions.json" --create-dirs "${CONFIGS_BASE_URL}/vscode/extensions.json"

echo $'\n'"source ${ENV_FILE}" >>"${HOME}/.bashrc"

cp /devbox/README-devbox.md "${HOME}/README-devbox.md"

# devbox

Welcome to devbox, a container as a development environment!

## Developer tools

The container comes pre-installed with popular developer tools.

- code, vim
- git, curl, jq
- gcc, g++, make, cmake
- python3, pip
- rustc, cargo, rustup
- deno, dx
- node, npm, npx, n

## SSH keys

New SSH keys without a passphrase has been generated.
You can add these public keys to source code hosting services to access to repositories via SSH.

```sh
cat ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_rsa.pub
```

## Git

Please configure your name and email address in Git as your author identity for commits.

```sh
git config --global user.name "Full Name"
git config --global user.email "username@example.com"
```

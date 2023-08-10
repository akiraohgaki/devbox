# devbox

Welcome to devbox, a container as a development environment!

The container comes pre-installed with popular developer tools.

- code, openvscode-server
- vim, git, curl, jq
- gcc, g++, make, cmake
- java, javac, mvn, gradle
- python3, pip
- rustc, cargo, rustup
- deno
- node, npm, n

## SSH keys

New SSH keys without a passphrase has been generated.
You can add these public keys to source code hosting services to access to repositories via SSH.

```sh
: Public Ed25519 key
cat ~/.ssh/id_ed25519.pub

: Public RSA key
cat ~/.ssh/id_rsa.pub
```

## Git

Please configure your name and email address in Git as your author identity for commits.

```sh
: Set your name
git config --global user.name "Full Name"

: Set your email address
git config --global user.email "username@example.com"
```

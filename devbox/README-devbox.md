# devbox

Welcome to devbox, a container as a development environment!

The container comes pre-installed with Visual Studio Code Server and other popular developer tools.

- code-server
- vim, git, curl, jq
- gcc, g++, make, cmake
- java, javac, mvn, gradle
- python3, pip
- rustc, cargo, rustup
- deno
- node, npm, n

## SSH keys

New SSH keys without passphrase has been generated, you can add these public keys to source code hosting services to access the source code repositories.

```sh
: Public Ed25519 key
cat ~/.ssh/id_ed25519.pub
```

```sh
: Public RSA key
cat ~/.ssh/id_rsa.pub
```

## Git

Please configure your name and email address in Git, for author identity for commits.

```sh
: Set your name
git config --global user.name "Your Name"
```

```sh
: Set your email address
git config --global user.email "username@example.com"
```
# devbox

A container as a development environment.

![screenshot-01](images/screenshot-01.jpg)

![screenshot-02](images/screenshot-02.jpg)

## How to run the devbox container

### GitHub Codespaces

To use the devbox container in GitHub Codespaces, create codespace on this repository. That's all.

### Visual Studio Code Server

To use the devbox container as Visual Studio Code Server that can be accessed locally, run the following in your terminal, then open http://localhost:8000/ in your browser.

```sh
docker run --name devbox -p 8000:8000 -d docker.io/akiraohgaki/devbox
```

To use the devbox container as Visual Studio Code Server that can be accessed from https://vscode.dev/ and from any Visual Studio Code desktop, run the following in your terminal, then follow the on-screen instructions.

```sh
docker run --name devbox -ti docker.io/akiraohgaki/devbox code-server serve
```

### Use with terminal

You can also run the devbox container with any command like zsh so that Visual Studio Code Server does not start automatically.

```sh
docker run --name devbox -ti docker.io/akiraohgaki/devbox zsh
```

> When first run, setup process is executed and SSH keys without passphrase for the user within the container is automatically generated, and tools (for example ZSH, Git, Vim, and Visual Studio Code Server) are also preconfigured.

## Pre-installed developer tools

Ubuntu based container is running and ready to development with below.

- Visual Studio Code Server
- Vim
- Git
- C/C++
- Java
- Python
- Rust
- Deno
- Node.js
- and many more tools

## Default user

The default user has sudo rights, but no password is asked.

- Username: devbox (UID: 1000)
- Groupname: devbox (GID: 1000)
- Password: devbox
- Shell: /bin/zsh
- sudo: Full privileged

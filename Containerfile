FROM docker.io/library/ubuntu:latest

ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_USERNAME=devbox
ARG USER_GROUPNAME=devbox
ARG USER_PASSWORD=devbox
ARG USER_SHELL=/bin/zsh

RUN apt update && \
  DEBIAN_FRONTEND=noninteractive apt upgrade -y --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  ca-certificates \
  sudo \
  zsh \
  ssh \
  curl \
  wget \
  zip \
  unzip \
  nano \
  vim \
  git \
  jq \
  build-essential \
  cmake \
  default-jre \
  default-jdk \
  maven \
  gradle \
  python3 \
  python3-pip && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

COPY devbox /devbox

RUN chmod 755 /devbox/entrypoint.sh

RUN groupadd -g ${USER_GID} ${USER_GROUPNAME} && \
  useradd -m -s ${USER_SHELL} -u ${USER_UID} -g ${USER_GID} ${USER_USERNAME} && \
  gpasswd -a ${USER_USERNAME} sudo && \
  echo "${USER_USERNAME}:${USER_PASSWORD}" | chpasswd && \
  echo "${USER_USERNAME} ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

USER ${USER_USERNAME}

WORKDIR /home/${USER_USERNAME}

ENTRYPOINT ["/devbox/entrypoint.sh"]

CMD ["env"]

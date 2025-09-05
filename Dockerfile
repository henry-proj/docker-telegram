FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# title
ENV TITLE=Telegram

RUN \
  echo "**** add icon ****" && \
  curl -o \
    /kclient/public/icon.png \
    "https://avatars.githubusercontent.com/u/6113871?s=48&v=4" && \
  echo "**** download Telegram ****" && \
  curl -L -o \
     /tmp/tsetup.tar.xz \
     https://github.com/telegramdesktop/tdesktop/releases/download/v6.1.0/tsetup.6.1.0.tar.xz && \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends xz-utils libgtk-3-0 && \
  tar xf /tmp/tsetup.tar.xz -C /opt && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config

FROM ubuntu:xenial

LABEL org.opencontainers.image.source https://github.com/phartenfeller/no-more-room-in-hell-docker

RUN apt-get update && \
  apt-get install -y wget lib32gcc1 lib32tinfo5 unzip nginx

RUN useradd -ms /bin/bash steam
WORKDIR /home/steam

USER steam

RUN wget -O /tmp/steamcmd_linux.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
  tar -xvzf /tmp/steamcmd_linux.tar.gz && \
  rm /tmp/steamcmd_linux.tar.gz

RUN ./steamcmd.sh +login anonymous +force_install_dir ./nmrih +app_update 317670 validate +quit # Update to date as of 2016-02-06

ENV SRV_HOSTNAME My NMRIH Server
ENV SRV_PASSWORD ""
ENV RCON_PASSWORD secretPassword

EXPOSE 27015/udp
EXPOSE 27015
EXPOSE 1200
EXPOSE 27005/udp
EXPOSE 27020/udp
EXPOSE 26901/udp

ADD ./entrypoint.sh entrypoint.sh

RUN ln -s /home/steam/linux32/ /home/steam/.steam/sdk32

CMD ./entrypoint.sh

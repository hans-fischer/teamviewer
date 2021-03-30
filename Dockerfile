FROM ghcr.io/linuxserver/rdesktop

RUN apt update && apt install xz-utils

RUN curl -L https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -o teamviewer_amd64.deb
RUN sudo apt install -y ./teamviewer_amd64.deb

WORKDIR /config
RUN curl -L https://download.teamviewer.com/download/linux/teamviewer_amd64.tar.xz -o teamviewer_amd64.tar.xz
RUN tar --xz -xf teamviewer_amd64.tar.xz
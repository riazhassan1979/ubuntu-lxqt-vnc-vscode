FROM dorowu/ubuntu-desktop-lxde-vnc:focal-lxqt
RUN sed -i 's#http://archive.ubuntu.com/ubuntu/#mirror://mirrors.ubuntu.com/mirrors.txt#' /etc/apt/sources.list;

ENV DEBIAN_FRONTEND noninteractive
#upgrade all system packages, remove unused/orphaned packages and finally remove old versions from cache then install wget code git python2 and python3
RUN apt update -y
RUN apt upgrade -y
RUN apt autoremove -y
RUN apt update --fix-missing -y
RUN apt install software-properties-common apt-transport-https wget -y
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt install wget code git python3 python3-pip -y

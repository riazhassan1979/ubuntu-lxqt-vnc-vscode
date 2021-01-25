# ubuntu-lxqt-vnc-vscode
Docker Devtools Base Container - Ubuntu lxqt with vnc vscode git and python

A useful development tools environment, using Dorowu/ubuntu-desktop-lxde-vnc as a base I've added vscode, wget, git and python3.
Use as a base to build your own custom development tools/local developer environments that you can connect to via VNC.

I recommend mapping a docker volume and mapping it to your /home/dev_user folder if you wish to persist things over restart of your container.

See the following documentation at dorowu/ubuntu-desktop-lxde-vnc for more info on the command line parameters supported by the base OS https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc

Simple run command:
docker run -d -e USER=dev_user -e PASSWORD=dev_password -p 8080:80 -p 5900:5900 -e RESOLUTION=1920x1080 -e VNC_PASSWORD=vnc_password -v /dev/shm:/dev/shm -v CREATE_YOUR_VOLUME_SPECIFCY_NAMEHERE:/home/dev_user riazhassan/ubuntu-lxqt-vnc-vscode

To run via bat file:


run.bat

set VNC_PASSWORD=p@ssw0rd123
set HTTP_VNC_PORT=6080
set VNC_PORT=5900
set RES_WIDTH=1870
set RES_HEIGHT=1030
set USER=dev_user
set PASSWORD=dev_password
set DOCKER_USER_HOME_PATH=X:\docker\file-share
set CODE_MOUNT_PATH=X:\ProjectCode

@echo off
@echo using base image dorowu/ubuntu-desktop-lxde-vnc (see full specs and features @ https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc)
docker run -d -e USER=%USER% -e PASSWORD=%PASSWORD% -e RESOLUTION=%RES_WIDTH%x%RES_HEIGHT% -e VNC_PASSWORD=%VNC_PASSWORD% -p
%HTTP_VNC_PORT%:80 -p %VNC_PORT%:5900 -v /dev/shm:/dev/shm -v "%CODE_MOUNT_PATH%":/code -v "%DOCKER_USER_HOME_PATH%":/home/%USER% riazhassan/ubuntu-lxqt-vnc-vscode
@echo Browse http://127.0.0.1:%HTTP_VNC_PORT%/ or run your vnc client against port %VNC_PORT%

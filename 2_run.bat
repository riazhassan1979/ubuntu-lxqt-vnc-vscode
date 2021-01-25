set HOSTNAME=devtools
set VNC_PASSWORD=p@ssw0rd123
set HTTP_VNC_PORT=6080
set VNC_PORT=5900
set RES_WIDTH=1870
set RES_HEIGHT=1030
set USER=dev_user
set PASSWORD=dev_password
set DOCKER_USER_HOME_PATH=X:\docker\file-share\desktop
set CODE_MOUNT_PATH=X:\docker\file-share\code
set RUN_COMMAND=ln /code ~/code -ds

@echo off
@echo using base image dorowu/ubuntu-desktop-lxde-vnc (see full specs and features @ https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc)
docker run -d --hostname %HOSTNAME% -e USER=%USER% -e PASSWORD=%PASSWORD% -e RESOLUTION=%RES_WIDTH%x%RES_HEIGHT% -e VNC_PASSWORD=%VNC_PASSWORD% -p %HTTP_VNC_PORT%:80 -p %VNC_PORT%:5900 -v /dev/shm:/dev/shm -v "%CODE_MOUNT_PATH%":/code -v "%DOCKER_USER_HOME_PATH%":/home/%USER% riazhassan/ubuntu-lxqt-vnc-vscode %RUN_COMMAND%
@echo Browse http://127.0.0.1:%HTTP_VNC_PORT%/ or run your vnc client against port %VNC_PORT%
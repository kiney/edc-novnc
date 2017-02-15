#!/bin/bash

# use ENV PASSWORD with  "password" as default
PWD=${PASSWORD:-password}

for USER in temp persist
do
    mkdir /home/${USER}/.vnc
    echo ${PWD} | vncpasswd -f > /home/${USER}/.vnc/passwd
    chown -R ${USER}:${USER} /home/${USER}/.vnc
    chmod 0600 /home/${USER}/.vnc/passwd
    su ${USER} -c vncserver
done

/usr/share/novnc/utils/launch.sh --listen 80 --vnc localhost:5901

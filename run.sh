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

for DISP in 1 2
do
    /usr/share/novnc/utils/launch.sh --listen 608${DISP} --vnc localhost:590${DISP} &
done
bash

#!/bin/bash


# use ENV PASSWORD with  "password" as default
PWD=${PASSWORD-password}

for USER in temp persist
do
    mkdir /home/${USER}/.vnc
    echo ${PWD} | vncpasswd -f > /home/${USER}/.vnc/passwd
    chown -R ${USER}:${USER} /home/${USER}/.vnc
    chmod 0600 /home/${USER}/.vnc/passwd
    su ${USER} -c vncserver
done

#chmod? -rw------- 1 root root 8 Feb 15 15:28 passwd

# für beide user
#vncserver ...#["/usr/bin/vncserver", "-fg"]

#vncserver -fg
bash

# TODO novnc

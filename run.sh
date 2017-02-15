# TODO: passwort aus $PASSWORD übernehmen und mit
echo ${PASSWORD} | vncpasswd -f > /home/persistent/.vnc/passwd
#chmod? -rw------- 1 root root 8 Feb 15 15:28 passwd

# für beide user
vncserver ...#["/usr/bin/vncserver", "-fg"]

...

# TODO novnc

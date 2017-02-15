FROM debian:stretch

RUN apt-get update \
	&& apt-get install -y \
	tigervnc-standalone-server \
	net-tools \
	xterm \
	novnc

ADD vnc.conf /etc/vnc.conf

CMD ["/usr/bin/vncserver", "-fg"]

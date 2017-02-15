FROM debian:stretch

RUN apt-get update \
	&& apt-get install -y \
	tigervnc-standalone-server \
	net-tools \
	xterm \
	novnc

ADD vnc.conf /etc/vnc.conf

EXPOSE 5091

CMD ["/usr/bin/vncserver", "-fg"]

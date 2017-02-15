FROM debian:stretch

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	tigervnc-standalone-server \
	net-tools \
	xterm \
	novnc

ADD vnc.conf /etc/vnc.conf
ADD run.sh

EXPOSE 5091

CMD ["TODO/tini", "/run.sh"]

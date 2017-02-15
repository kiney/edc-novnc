FROM debian:stretch

# install basic and VNC stuff
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	tigervnc-standalone-server \
	tigervnc-common \
	net-tools \
	xterm \
	novnc

ADD vnc.conf /etc/vnc.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 5091

# Add Tini
ENV TINI_VERSION v0.14.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["/run.sh"]

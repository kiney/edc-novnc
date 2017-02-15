FROM debian:stretch

# install basic and VNC stuff
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	tigervnc-standalone-server \
	tigervnc-common \
	net-tools \
	vim-nox \
	xterm \
	novnc \
	mesa-utils \
	libgl1-mesa-dri

# install desktop environment (xfce for now... which seems to need dbus-x11)
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	xfce4 \
	xfce4-terminal \
	dbus-x11

RUN useradd -ms /bin/bash temp
RUN useradd -ms /bin/bash persist

EXPOSE 5901 5902

# Add Tini
ENV TINI_VERSION v0.14.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ADD vnc.conf /etc/vnc.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

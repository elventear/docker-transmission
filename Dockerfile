FROM elventear/supervisord:latest

MAINTAINER Pepe Barbe <dev@antropoide.net>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common 

RUN add-apt-repository -y ppa:transmissionbt/ppa && \
    apt-get update && \
    apt-get install -y transmission-daemon && \
    mkdir /Downloads

ADD files/transmission-daemon /etc/transmission-daemon

EXPOSE 9091
EXPOSE 12345

CMD ["-f", "--utp", "--lpd", "--dht", "--download-dir", "/Downloads", "--peerport", "12345", "--no-portmap", "--config-dir", "/etc/transmission-daemon"]
ENTRYPOINT ["/usr/bin/transmission-daemon"]

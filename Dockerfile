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
ADD files/run_transmission.sh /run_transmission.sh

VOLUME ["/Downloads"]

EXPOSE 9091
EXPOSE 12345

CMD ["/run_transmission.sh"]

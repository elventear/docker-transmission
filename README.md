docker-transmission
===================

Transmission Daemon Docker Container

Application container, don't forget to specify a password for `transmission` account and local directory for the downloads:

    docker run -p 12345:12345 -p 12345:12345/udp -p 127.0.0.1:9091:9091 -e ADMIN_PASS=password -v /var/lib/transmission-daemon/downloads:/local/dir --name APP elventear/transmission


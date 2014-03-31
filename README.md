docker-transmission
===================

Transmission Daemon Docker Container

Application container, don't forget to specify a password for `transmission` account.

    docker run -p 12345:12345 -p 127.0.0.1:9091:9091 -e ADMIN_PASS=password -v /var/lib/transmission-daemon/downloads:/local/dir --name APP elventear/transmission


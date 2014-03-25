docker-transmission
===================

Transmission Daemon Docker Container

Separate data container:
    
    docker run -v /Downloads:/local/dir --name DATA --entrypoint true elventear/transmission  

Application container, don't forget to specify a password for `transmission` account.

    docker run -p 12345:12345 -p 127.0.0.1:9091:9091 -e ADMIN_PASS=password --volumes-from DATA --name APP elventear/transmission


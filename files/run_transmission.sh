#!/bin/bash

set -e

CONFIG_DIR=/etc/transmission-daemon
SETTINGS=$CONFIG_DIR/settings.json
TRANSMISSION=/usr/bin/transmission-daemon

if [[ ! -f ${SETTINGS}.bak ]]; then
    if [[ $NO_AUTH == TRUE ]]; then
        sed -i.bak -e "s/@authentication@/false/" $SETTINGS
    elif [ -z $ADMIN_PASS ]; then
        echo Please provide a password for the 'transmission' user via the ADMIN_PASS enviroment variable.
        exit 1
    else
        sed -i.bak -e "s/@authentication@/true/" $SETTINGS
        sed $SETTINGS -e "s/@password@/$ADMIN_PASS/" $SETTINGS
    fi

fi

unset ADMIN_PASS

exec $TRANSMISSION -f --no-portmap --config-dir $CONFIG_DIR --log-info 



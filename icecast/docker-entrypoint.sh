#!/bin/sh
set -e

if ls "/usr/share/icecast/icecast.xml.template" 1> /dev/null 2>&1; then
    sed -e "s/{{ ICECAST_ADMIN }}/${ICECAST_ADMIN}/g" \
        -e "s/{{ ICECAST_HOSTNAME }}/${ICECAST_HOSTNAME}/g" \
        -e "s/{{ ICECAST_LOCATION }}/${ICECAST_LOCATION}/g" \
        -e "s/{{ ICECAST_PASSWORD }}/${ICECAST_PASSWORD}/g" \
        /usr/share/icecast/icecast.xml.template >| /usr/share/icecast/icecast.xml
fi

exec "$@"

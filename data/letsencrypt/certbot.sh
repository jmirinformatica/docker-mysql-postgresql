#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

docker run -it --rm --name certbot \
        -p 80:80 -p 443:443 \
        -v "$SCRIPTPATH:/etc/letsencrypt" \
        certbot/certbot $@

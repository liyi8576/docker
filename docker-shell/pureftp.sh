#!/bin/bash
docker rm -f ftpd_server &> /dev/null
docker run -idt \
    -p 21:21 \
    -p 30000-30209:30000-30209 \
    -e "PUBLICHOST=localhost" \
    --privileged=true \
    -v /Users/liyi/Study/docker-files:/home/ftpuser/liyi \
    --name ftpd_server \
    -h ftpd_server
    stilliard/pure-ftpd:hardened /bin/bash


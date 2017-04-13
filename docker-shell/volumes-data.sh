#!/bin/bash
docker rm -f volume-data &> /dev/null
docker run -it \
        -v /Users/liyi/Study/docker-files:/home/local \
        --name volume-data \
        -h volume-data \
        ubuntu:latest


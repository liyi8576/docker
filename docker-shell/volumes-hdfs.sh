#!/bin/bash
docker rm -f volume-hdfs &> /dev/null
docker run -it \
        -v /Users/liyi/Develop/hdfs:/hdfs \
        --name volume-hdfs \
        -h volume-hdfs \
        ubuntu:latest


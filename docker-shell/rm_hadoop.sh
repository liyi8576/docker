#!/bin/bash
echo "Remove hadoop docker container"
docker ps -a |grep liyi/ubuntu-hadoop:1.0|awk '{print $1}'|xargs docker rm -f
echo "Remove hadoop docker image"
docker rmi -f liyi/ubuntu-hadoop:1.0
echo "Remove None docker image"
docker images|grep '<none>'|awk '{print $3}'|xargs docker rmi -f
docker images

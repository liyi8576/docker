#!/bin/bash
sudo docker rm -f hive-server &> /dev/null
echo "start hive-server$i container..."
docker run -itd \
        -p 40070:50070 \
        -p 40030:50030 \
        -p 48088:8088 \
        -p 40022:22 \
        -p 49083:9083 \
        -p 49000:9000 \
        -p 40020:50020 \
        -p 40075:50075 \
        -p 40090:50090 \
        -p 10000:10000 \
        -p 10002:10002 \
        --net=hadoop \
        --name hive-server \
        --hostname hive-server \
        --link mysql-dev:mysql-dev \
        --volumes-from volume-data \
        --volumes-from volume-hdfs \
        liyi/ubuntu-hive:1.0 &> /dev/null
docker exec -it  hive-server /bin/bash


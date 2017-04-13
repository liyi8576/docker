#!/bin/bash

# the default node number is 3
N=${1:-3}

# start hadoop master container
docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 50030:50030 \
                -p 8088:8088 \
                -p 50022:22 \
                -p 9083:9083 \
                -p 9000:9000 \
                -p 50020:50020 \
                -p 50075:50075 \
                -p 50090:50090 \
                --name hadoop-master \
                --hostname hadoop-master \
                --volumes-from volume-data \
                --volumes-from volume-hdfs
                liyi/ubuntu-hadoop:1.0 &> /dev/null

# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
                    -p $i8042:8042 \
                    --volumes-from volume-data \
                    --volumes-from volume-hdfs \
	                liyi/ubuntu-hadoop:1.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash

#!/bin/bash

sudo service ssh start

if [[ $2 == "master" ]]; then 
    echo "start hbase server ::::::"
    nohup /usr/local/hbase/bin/hbase-daemon.sh start master >> /home/hadoop/master.out 2>&1 & 
else
    nohup /usr/local/hbase/bin/hbase-daemon.sh start regionserver >> /home/hadoop/regionserver.out 2>&1 &
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi

if [[ $1 == "-d" ]]; then
    sleep 3s
    if [[ $2 == "master" ]]; then
        tail -f /home/hadoop/master.out
    else
        tail -f /home/hadoop/regionserver.out
    fi
fi

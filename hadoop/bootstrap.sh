#!/bin/bash
if [[ $1 == "-bash" ]]; then
    /bin/bash
else
    sudo service ssh start 
    if [[ $2 == "namenode" ]]; then
        echo  "start namenode::::::"
        nohup /usr/local/hadoop/bin/hdfs namenode >> /home/hadoop/namenode.out 2>&1 &
        echo  "start resourcemanager::::::"
        nohup /usr/local/hadoop/bin/yarn resourcemanager >> /home/hadoop/resourcemanager.out 2>&1 &
        sleep 3s
        tail -f /home/hadoop/namenode.out
    else
        echo  "start datanode::::::"
        nohup /usr/local/hadoop/bin/hdfs datanode >> /home/hadoop/datanode.out 2>&1 & 
        echo  "start nodemanager::::::"
        nohup /usr/local/hadoop/bin/yarn nodemanager >> /home/hadoop/nodemanager.out 2>&1 &
        sleep 3s
        tail -f /home/hadoop/datanode.out
    fi
fi

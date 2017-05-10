#!/bin/bash

sudo service ssh start

echo "start metastore::::::"
nohup /usr/local/hive/bin/hive --service metastore >> /home/hadoop/metastore.out 2>&1 &
echo "start hiveserver2:::::: "
nohup /usr/local/hive/bin/hive --service hiveserver2 --hiveconf HIVE_SERVER2_THRIFT_PORT=10000 >>/home/hadoop/hiveserver2.out 2>&1 &

sleep 3s
echo "hiveserver2 log::::::"
tail -f /home/hadoop/hiveserver2.out

#!/bin/bash
docker rm -f mysql-dev &> /dev/null
docker run -itd \
        -p 3306:3306 \
        -v /Users/liyi/Develop/mysql-data:/var/lib/mysql \
        --volumes-from volume-data \
        --name mysql-dev \
        --net hadoop \
        -h mysql-dev \
        -e MYSQL_ROOT_PASSWORD=8576 \
        -e MYSQL_DATABASE=dev \
        mysql:latest


# Backup data
# docker exec mysql-dev  /usr/bin/mysqldump -u root --password=8576 hive > backup.sql

# Restore
# docker exec -i mysql-dev /usr/bin/mysql -u root --password=8576 hive < backup.sql

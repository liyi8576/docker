#######################################
# version : liyi/zookeeper:1.0
# desc:
######################################

FROM liyi/jdk:1.0

MAINTAINER liyi (liyi8576@gmail.com)

WORKDIR  /usr/local

ARG  HOST_IP

RUN curl http://$HOST_IP:8000/zookeeper-3.4.10.tar.gz -o zookeeper-3.4.10.tar.gz && \
        tar -zxvf zookeeper-3.4.10.tar.gz && \
        mkdir -p /var/zookeeper/myid && \
        ln -s ./zookeeper-3.4.10 zookeeper     

COPY zoo.cfg zookeeper/conf/

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 2181 2888 3888

ENV ZOOKEEPER_HOME=/usr/local/zookeeper-3.4.10 \
    PATH=${ZOOKEEPER_HOME}/bin:$PATH


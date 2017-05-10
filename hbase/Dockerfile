##########################################
# version : liyi/hbase:v1
# desc    : 基于hadoop镜像安装hbase
##########################################

FROM liyi/jdk:1.0

MAINTAINER liyi (liyi8576@gmail.com)

WORKDIR /usr/local

ARG HOST_IP
ARG DISTRO_NAME=hbase-1.2.5-bin
ARG DISTRO_DIR=hbase-1.2.5

RUN groupadd hadoop && \
      #添加用户  
      useradd -m hadoop -g hadoop && \
      echo "hadoop:hadoop" | chpasswd && \
      echo "hadoop ALL= NOPASSWD: ALL" >> /etc/sudoers && \
      # 生成SSH秘钥
      mkdir /home/hadoop/.ssh && \
      ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
      cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
      # 安装hbase 
      curl http://$HOST_IP:8000/$DISTRO_NAME.tar.gz -o $DISTRO_NAME.tar.gz && \
      tar -zxvf $DISTRO_NAME.tar.gz && \
      rm -rf ./$DISTRO_DIR/docs && \ 
      rm -f $DISTRO_NAME.tar.gz && \
      chown -R hadoop:hadoop ./$DISTRO_DIR && \
      ln -s ./hbase-1.2.5 hbase 

ENV PATH /usr/local/hbase/bin:$PATH
ENV HBASE_HOME /usr/local/hbase

COPY ssh_config /home/hadoop/.ssh/config
COPY conf $HBASE_HOME/conf/
COPY bootstrap.sh /home/hadoop/bootstrap.sh

RUN chmod +x /home/hadoop/bootstrap.sh

USER hadoop

EXPOSE 60010

ENTRYPOINT ["/home/hadoop/bootstrap.sh"]

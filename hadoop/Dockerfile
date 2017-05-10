############################################
# version : liyi/hadoop
# desc: ubuntu 安装Hadoop
############################################
FROM liyi/jdk:1.0

MAINTAINER liyi (liyi8576@gmail.com)

ARG HOST_IP
ARG DISTRO_NAME=hadoop-2.7.3

# 设定工作目录
WORKDIR /usr/local

RUN groupadd hadoop && \
       #添加用户 
      useradd -m hadoop -g hadoop && \
      echo "hadoop:hadoop" | chpasswd && \
      echo "hadoop ALL= NOPASSWD: ALL" >> /etc/sudoers && \
      # 生成SSH秘钥
      mkdir /home/hadoop/.ssh && \
      ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
      cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
      # 安装Hadoop
      # http://www-eu.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz
      curl http://$HOST_IP:8000/$DISTRO_NAME.tar.gz -o $DISTRO_NAME.tar.gz && \
      tar -zxvf $DISTRO_NAME.tar.gz && \
      rm -f $DISTRO_NAME.tar.gz && \
      rm -rf ./$DISTRO_NAME/share/doc && \
      find ./$DISTRO_NAME/share/hadoop -type d -name "sources" |xargs rm -rf && \
      mkdir ./$DISTRO_NAME/logs && \
      ln -s ./$DISTRO_NAME hadoop && \
      chown -R hadoop:hadoop ./$DISTRO_NAME && \
      chmod +x ./$DISTRO_NAME/sbin/*.sh && \
      mkdir -p /home/hadoop/dfs/namenode && \
      chown -R hadoop:hadoop /home/hadoop

# 配置Hadoop环境变量
ENV HADOOP_PREFIX=/usr/local/hadoop \
      HADOOP_HOME=/usr/local/hadoop \
      HADOOP_COMMON_HOME=/usr/local/hadoop \
      HADOOP_HDFS_HOME=/usr/local/hadoop \
      HADOOP_MAPRED_HOME=/usr/local/hadoop \
      HADOOP_YARN_HOME=/usr/local/hadoop \
      HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop \
      PATH=/usr/local/hadoop/bin:$PATH

# 设置用户
USER hadoop

# 添加Hadoop配置文件
COPY  conf $HADOOP_HOME/etc/hadoop/
COPY  ssh_config /home/hadoop/.ssh/config
COPY  *.sh /home/hadoop/
RUN   sudo chmod +x ~/*.sh  && \
      hdfs namenode -format

# Hdfs ports
#EXPOSE 9000 50010 50020 50070 50075 50090
# See https://issues.apache.org/jira/browse/HDFS-9427
#EXPOSE 9871 9870 9820 9869 9868 9867 9866 9865 9864
# Mapred ports
#EXPOSE 19888
#Yarn ports
#EXPOSE 8030 8031 8032 8033 8040 8042 8088 8188
#Other ports
#EXPOSE 49707 2122

ENTRYPOINT ["/home/hadoop/bootstrap.sh"]

##########################################
# version : liyi/hive:v1
# desc    : 基于hadoop镜像安装hiveserver
##########################################

FROM liyi/hadoop:1.0

MAINTAINER liyi (liyi8576@gmail.com)

WORKDIR /usr/local

ARG HOST_IP
ARG DISTRO_NAME=apache-hive-2.1.1-bin

USER root

RUN curl http://$HOST_IP:8000/$DISTRO_NAME.tar.gz -o $DISTRO_NAME.tar.gz && \
      tar -zxvf $DISTRO_NAME.tar.gz && \
      rm -f $DISTRO_NAME.tar.gz && \
      ln -s ./$DISTRO_NAME hive && \
      curl http://$HOST_IP:8000/mysql-connector-java-5.1.41-bin.jar -o mysql-connector-java-5.1.41-bin.jar && \
      mv mysql-connector-java-5.1.41-bin.jar /usr/local/hive/lib && \
      chown -R hadoop:hadoop /usr/local/$DISTRO_NAME

COPY conf ./hive/conf/
COPY bootstrap.sh /home/hadoop/bootstrap.sh

ENV PATH /usr/local/hive/bin:$PATH
ENV HIVE_HOME /usr/local/hive
ENV HIVE_CONF /usr/local/hive/conf

USER hadoop

RUN sudo chmod +x ~/bootstrap.sh

EXPOSE 10000 10002

ENTRYPOINT ["/home/hadoop/bootstrap.sh","-d"]

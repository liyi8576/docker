############################################
# version : liyi/Ubuntu-JDK
# desc: ubuntu 安装JDK
############################################
FROM liyi/base:1.0

MAINTAINER liyi (liyi8576@gmail.com)

ARG HOST_IP
ARG DISTRO_NAME=jdk-8u121-linux-x64
ARG DISTRO_DIR=jdk1.8.0_121

WORKDIR /usr/local
# 安装JDK
# apt-get install -y openjdk-7-jdk
# http://mirrors.linuxeye.com/jdk/jdk-8u121-linux-x64.tar.gz
RUN curl http://$HOST_IP:8000/$DISTRO_NAME.tar.gz -o $DISTRO_NAME.tar.gz && \
      tar -zxvf $DISTRO_NAME.tar.gz && \
      rm -rf ./$DISTRO_DIR/lib/missioncontrol && \ 
      rm -f ./$DISTRO_DIR/*src.zip  && \
      rm -r $DISTRO_NAME.tar.gz  && \
      ln -s  ./$DISTRO_DIR /usr/local/jdk 

# 配置JDK环境变量
ENV JAVA_HOME=/usr/local/$DISTRO_DIR \
    CLASSPATH=/usr/local/$DISTRO_DIR/lib/dt.jar:/usr/local/$DISTRO_DIR/lib/tools.jar \
    PATH=/usr/local/$DISTRO_DIR//bin:$PATH

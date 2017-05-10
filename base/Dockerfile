############################################
# version : liyi/base:1.0
# desc: ubuntu 安装SSH、vim、wget、curl、sudo
############################################
FROM ubuntu:latest

MAINTAINER liyi (liyi8576@gmail.com)

ENV LANG C.UTF-8

# 添加国内镜像源地址
ADD sources.list /etc/apt/

# 安装SSH、vim、wget、curl、sudo等常用工具
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl sudo vim wget openssh-server openssh-client && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# 添加用户，初始化密码，赋予sudo权限
RUN useradd -m liyi && \
    echo "liyi:liyi" | chpasswd && \
    cd /etc/sudoers.d && touch nopasswdsudo && echo "liyi ALL=(ALL) ALL" >> nopasswdsudo && \
    usermod -s /bin/bash liyi

# 配置SSH
RUN mkdir -p /var/run/sshd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

FROM nerro/base:wheezy
MAINTAINER Pavel Sorokin <pavel.sorokin@nerro.eu>

RUN wget --no-check-certificate --directory-prefix=/tmp \
         --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u31-b13/server-jre-8u31-linux-x64.tar.gz && \
    mkdir /opt/java && \
    tar -xzf /tmp/server-jre-8u31-linux-x64.tar.gz -C /opt/java && \
    update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_31/bin/java 100 && \
    rm -rf /tmp/* && rm -rf /var/log/*

ENV JAVA_HOME=/opt/java/jdk1.8.0_31


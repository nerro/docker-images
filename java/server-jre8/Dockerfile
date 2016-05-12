FROM nerro/base:wheezy
MAINTAINER Pavel Sorokin <pavel.sorokin@nerro.eu>

ENV JAVA_VERSION 8u92

RUN wget --no-check-certificate --output-document /javinla.sh https://github.com/nerro/javinla/releases/download/v0.2.0/javinla.sh \
    && chmod +x /javinla.sh \
    && /javinla.sh install ${JAVA_VERSION} \
    && rm -rf /javinla.sh

ENV JAVA_HOME /opt/java/${JAVA_VERSION}

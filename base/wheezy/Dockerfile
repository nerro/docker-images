FROM debian:wheezy-slim
MAINTAINER Pavel Sorokin <pavel.sorokin@nerro.eu>

RUN apt-get update && apt-get install -y --no-install-recommends \
        wget \
    && rm -rf /var/lib/apt/lists \
    && rm -rf /var/log/* \
    && rm -rf /tmp/*


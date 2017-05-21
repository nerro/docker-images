FROM debian:wheezy-slim
LABEL maintainer "Pavel Sorokin <pavel.sorokin@nerro.eu>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
    && rm -rf /var/lib/apt/lists \
    && rm -rf /var/log/* \
    && rm -rf /tmp/*

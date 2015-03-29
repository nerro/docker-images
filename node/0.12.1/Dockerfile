FROM nerro/base:wheezy
MAINTAINER Pavel Sorokin <pavel.sorokin@nerro.eu>

# latest stable versions:
# - node.js: 0.12.1
# - npm:     2.7.4

RUN wget --directory-prefix=/tmp \
        http://nodejs.org/dist/v0.12.1/node-v0.12.1-linux-x64.tar.gz \
    && tar -xzf /tmp/node-v0.12.1-linux-x64.tar.gz -C /usr/local --strip-components=1 \
    && npm install -g npm@2.7.4 \
    && npm cache clear \
    && rm -rf /var/log/* \
    && rm -rf /tmp/*


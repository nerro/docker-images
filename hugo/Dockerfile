FROM nerro/base:alpine

ENV HUGO_VERSION=0.25.1

RUN wget --output-document /tmp/hugo.tar.gz \
        https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/* /root/.wget-hsts

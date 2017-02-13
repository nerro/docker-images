FROM nerro/base:wheezy

ENV JAVA_VERSION 8u92

RUN wget --no-check-certificate --output-document /javinla https://github.com/nerro/javinla/releases/download/v1.0.0/javinla \
    && wget --no-check-certificate --output-document /javinla.sha1 https://github.com/nerro/javinla/releases/download/v1.0.0/javinla.sha1 \
    && sha1sum -c javinla.sha1 \
    && chmod +x /javinla \
    && /javinla install ${JAVA_VERSION} \
    && rm -rf /javinla*

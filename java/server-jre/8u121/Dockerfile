FROM nerro/base:wheezy

RUN wget --output-document /javinla https://github.com/nerro/javinla/releases/download/v1.1.0/javinla \
    && wget --output-document /javinla.sha1 https://github.com/nerro/javinla/releases/download/v1.1.0/javinla.sha1 \
    && sha1sum -c javinla.sha1 \
    && chmod +x /javinla \
    && /javinla version \
    && /javinla install 8u121 \
    && rm -rf /javinla*

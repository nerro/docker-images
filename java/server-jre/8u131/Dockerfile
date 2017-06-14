FROM nerro/base:wheezy

RUN wget --output-document /javinla https://raw.githubusercontent.com/nerro/javinla/master/javinla \
    && chmod +x /javinla \
    && /javinla version \
    && /javinla install 8u131 \
    && rm -rf /javinla*

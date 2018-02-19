FROM alpine:edge
ENV WORKERS 4
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.2.2/s6-overlay-amd64.tar.gz /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
        echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
        apk add --update dante-server@testing && \
        rm -Rf /var/cache/apk/*

COPY root /
ENTRYPOINT ["/init"]


# Build a minimal distribution container with openconnect as proxy

FROM registry:2

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN set -ex \
    && apk add --no-cache openconnect bash

COPY docker-entrypoint.sh /entrypoint.sh
COPY oc-connect.sh /oc-connect.sh
COPY registry.sh /registry.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/etc/docker/registry/config.yml"]

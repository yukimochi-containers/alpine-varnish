FROM debian:stretch-slim 

ARG VARNISH_VERSION=6.0.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl gcc libc6-dev libncurses5 libncurses5-dev libreadline-dev libpcre3 libpcre3-dev pkg-config python-docutils \
    && curl http://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz | tar xz \
    && cd varnish-${VARNISH_VERSION} \
    && ./configure \
    && make -j \
    && mkdir /tmp/rootfs \
    && make install \
    && cd .. \
    && rm -rf varnish-${VARNISH_VERSION} \
    && apt-get remove --purge -y build-essential curl libncurses5-dev libreadline-dev libpcre3-dev pkg-config python-docutils \
    && apt-get autoremove --purge -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/varnish
VOLUME [ "/etc/varnish" ]
EXPOSE 80

ENTRYPOINT [ "/usr/local/sbin/varnishd" ]
CMD [ "-F", "-f", "/etc/varnish/default.vcl", "-s", "malloc,1G", "-a", "0.0.0.0:80" ]

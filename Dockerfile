FROM alpine:3.8

ENV VARNISH_VER 6.1.1

RUN apk -U --no-cache upgrade && \
    apk add -U --no-cache --virt .dep build-base gcc libc-dev libgcc pcre-dev ncurses-dev libedit-dev py-docutils py-sphinx linux-headers libexecinfo-dev && \
    wget http://varnish-cache.org/_downloads/varnish-$VARNISH_VER.tgz && \
    tar fx varnish-$VARNISH_VER.tgz && \
    rm -r varnish-$VARNISH_VER.tgz && \
    cd varnish-$VARNISH_VER && \
    ./configure --without-jemalloc && \
    make -j$(getconf _NPROCESSORS_ONLN) && \
    make install && \
    cd .. && \
    rm -r varnish-$VARNISH_VER && \
    apk del .dep \
    rm -rf /tmp/* /var/cache/apk/*

RUN apk add -U --no-cache busybox gcc libc-dev libedit libexecinfo libgcc musl ncurses-libs pcre

WORKDIR /etc/varnish

VOLUME [ "/etc/varnish" ]
EXPOSE 80

CMD [ "/usr/local/sbin/varnishd", "-F", "-f", "/etc/varnish/default.vcl", "-s", "malloc,1G", "-a", "0.0.0.0:80" ]

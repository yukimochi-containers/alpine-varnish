FROM alpine:edge

ENV VARNISH_VER 6.2.0

RUN apk add -U --no-cache varnish=${VARNISH_VER}-r1

WORKDIR /etc/varnish

VOLUME [ "/etc/varnish" ]
EXPOSE 80

CMD [ "/usr/sbin/varnishd", "-F", "-f", "/etc/varnish/default.vcl", "-s", "malloc,1G", "-a", "0.0.0.0:80" ]

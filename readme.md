# alpine-varnish
Minimalistic Varnish HTTP Cache container with a small disk footprint.

*Notice* : For compatible issue, this reponame contains alpine. But this images is based Debian Stretch.

To configure Varnish mount an external volume to `/etc/varnish` with the
`default.vcl` file in them.

## Example Usage

````
docker run --name varnish -d -p 80:80 -v /home/yukimochi/varnish:/etc/varnish yukimochi-containers/alpine-varnish
````

## Supported architectures
[`amd64`](https://github.com/yukimochi-containers/alpine-varnish/blob/master/Dockerfile), [`arm32v7`](https://github.com/yukimochi-containers/alpine-varnish/blob/armv7/Dockerfile), [`arm64v8`](https://github.com/yukimochi-containers/alpine-varnish/blob/master/Dockerfile)

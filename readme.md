# alpine-varnish
Minimalistic Varnish HTTP Cache container with a small disk footprint.

To configure Varnish mount an external volume to `/etc/varnish` with the
`default.vcl` file in them.

## Build status

- amd64 image - ![AMD64 image Build status](https://img.shields.io/docker/build/yukimochi/alpine-varnish.svg)
- arm64v8 image - ![arm64v8 image Build status](https://ci.yukimochi.com/api/badges/yukimochi-containers/alpine-varnish/status.svg?branch=master)

## Example Usage

````
docker run --name varnish -d -p 80:80 -v /home/yukimochi/varnish:/etc/varnish yukimochi-containers/alpine-varnish
````

## Supported architectures
[`amd64`](https://github.com/yukimochi-containers/alpine-varnish/blob/master/Dockerfile), [`arm64v8`](https://github.com/yukimochi-containers/alpine-varnish/blob/master/Dockerfile)

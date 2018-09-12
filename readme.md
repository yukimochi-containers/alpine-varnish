# alpine-varnish
Minimalistic Varnish HTTP Cache container with a small disk footprint.

To configure Varnish mount an external volume to `/etc/varnish` with the
`default.vcl` file in them.

## Example Usage

````
docker run --name varnish -d -p 80:80 -v /home/yukimochi/varnish:/etc/varnish yukimochi-containers/alpine-varnish
````

## Supported architectures
`amd64`,`armv7`,`arm64v8`

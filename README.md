# docker-nginx-module-toolbox
Docker image to be used as a build and test environment for nginx modules.

## Building
```
# alpine:3
docker build . --file Dockerfile.alpine --build-arg IMAGE_BASE=alpine:3.12.0 --build-arg NGINX_VERSION=1.16.1

# amazonlinux:2
docker build . --file Dockerfile.amazonlinux --build-arg IMAGE_BASE=amazonlinux:2.0.20200722.0 --build-arg NGINX_VERSION=1.16.1

# ubuntu:20.04
docker build . --file Dockerfile.ubuntu --build-arg IMAGE_BASE=ubuntu:focal-20200925 --build-arg NGINX_VERSION=1.16.1
```
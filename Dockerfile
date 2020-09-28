ARG IMAGE_BASE_NAME
ARG IMAGE_BASE_VERSION

FROM ${IMAGE_BASE_NAME}:${IMAGE_BASE_VERSION}

ARG NGINX_VERSION

WORKDIR /tmp

RUN yum update -y

RUN yum install -y \
	bind-utils \
	expat-devel \
	clang \
	clang-tools-extra \
	curl \
	gcc \
	gcc-c++ \
	gzip \
	jq \
	openssl-devel \
	patch \
	pcre-devel \
	perl \
	perl-App-cpanminus \
	procps \
	tar \
	unbound \
	valgrind \
	which

RUN cpanm --force Spiffy
RUN cpanm Test::Base
RUN cpanm Test::Nginx

RUN unbound-control-setup
COPY unbound.conf /etc/unbound.conf
COPY unbound_local_zone.conf /etc/unbound_local_zone.conf

RUN curl -L http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz -o nginx.tar.gz
WORKDIR /src/nginx
RUN tar -xzvf /tmp/nginx.tar.gz --strip-components 1
RUN ./configure

WORKDIR /

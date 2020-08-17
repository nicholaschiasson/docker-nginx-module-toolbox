FROM amazonlinux:2

WORKDIR /tmp

RUN yum update -y

RUN yum install -y \
	bind-utils \
	expat-devel \
	clang \
	clang-tools-extra \
	gcc \
	gcc-c++ \
	gzip \
	openssl-devel \
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
COPY unbound.conf /tmp/unbound.conf
COPY unbound_local_zone_ngx_upstream_jdomain.conf /tmp/unbound_local_zone_ngx_upstream_jdomain.conf

WORKDIR /

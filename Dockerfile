FROM amazonlinux:2

WORKDIR /opt/nginx-module-toolbox

RUN yum groupinstall -y "Development Tools"

RUN yum install -y \
	bind-utils \
	gzip \
	openssl-devel \
	pcre-devel \
	perl \
	perl-App-cpanminus \
	procps \
	tar \
	unbound \
	valgrind

RUN cpanm --force Spiffy
RUN cpanm Test::Base
RUN cpanm Test::Nginx

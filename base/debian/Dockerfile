FROM debian:buster-slim

LABEL mantainer='DevOps Team'
LABEL description='Debian 10 Buster - A very stable Operating System'

# Smaller images
ARG APT_OPTS='--no-install-recommends --no-install-suggests'
ARG APT_ENV='DEBIAN_FRONTEND=noninteractive'
ARG LOCALTIME='UTC'

# Language
ENV LANG='es_ES.UTF-8'
ENV LANGUAGE='es_ES.UTF-8'

USER root

# Install tools
RUN apt-get update && \
	${APT_ENV} apt-get install ${APT_OPTS} -y \
	tzdata \
	locales \
	aptitude \
	vim \
	curl \
	wget \
	netcat \
	iputils-ping \
	iputils-tracepath \
	iputils-arping \
	default-mysql-client \
	net-tools \
	iproute2 \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common \
	git

# Install locales
RUN sed -i "s/^# *\(${LANG}\)/\1/" /etc/locale.gen && \
	locale-gen && \
	# Purge cache
	rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove

# Change localtime
RUN ln -sf "/usr/share/zoneinfo/${LOCALTIME}" /etc/localtime \
	&& dpkg-reconfigure -f noninteractive tzdata

CMD [ "bash" ]

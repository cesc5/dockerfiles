FROM debian:buster-slim

LABEL mantainer='DevOps Team'
LABEL description='Debian 10 Buster - A very stable Operating System'

# Smaller images
ARG APT_OPTS='--no-install-recommends --no-install-suggests'
ARG LOCALTIME='UTC'

# No user interaction
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG='es_ES.UTF-8'
ENV LANGUAGE='es_ES.UTF-8'

USER root

# Change localtime
RUN rm -f /etc/localtime && \
	ln -s "/usr/share/zoneinfo/${LOCALTIME}" /etc/localtime

# Install tools
RUN apt-get update && \
	apt-get install ${APT_OPTS} -y \
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
	iproute2 && \
	# Install locales
	sed -i "s/^# *\(${LANG}\)/\1/" /etc/locale.gen && \
	locale-gen && \
	# Purge cache
	rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove

CMD [ "bash" ]

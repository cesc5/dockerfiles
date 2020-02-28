FROM debian:buster-slim

LABEL Mantainer='DevOps Team'

USER root
RUN rm -f /etc/localtime && \
	ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Install tools
RUN apt-get update && \
	apt-get install -y \
	aptitude \
	vim \
	curl \
	netcat \
	iputils-ping \
	default-mysql-client && \
	# Purge cache
	rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove	

FROM debian:buster-slim

LABEL maintainer="TEAM"

ENV NGINX_VERSION   1.16.1
ENV PKG_RELEASE     1~buster

RUN set -x && \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
	  ca-certificates \
	  apt-transport-https \
	  gnupg2 && \
    # Add Repositories
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 && \
    echo "deb http://nginx.org/packages/debian/ buster nginx" > '/etc/apt/sources.list.d/nginx.list' && \
    echo "deb-src http://nginx.org/packages/debian/ buster nginx" >> '/etc/apt/sources.list.d/nginx.list' && \
    apt-get update && \
    # Install nginx version
    apt-get install --no-install-recommends --no-install-suggests nginx=${NGINX_VERSION}-${PKG_RELEASE} && \
    apt-get remove --purge --auto-remove -y ca-certificates && \
    rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/nginx.list

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

# set base Docker image to AdoptOpenJDK Ubuntu Docker image
FROM debian:buster-slim
LABEL MANTAINER="DevOps Team"

# set user configurations
ARG USER=rundeck
ARG USER_ID=1000
ARG USER_GROUP=rundeck
ARG USER_GROUP_ID=1000
ARG USER_HOME=/home/${USER}
# set wso2 product configurations
ARG RUNDECK_DEB_FILE=rundeck_3.2.2.20200204-1_all.deb
ARG RUNDECK_SERVER_DIST_URL=https://download.rundeck.org/deb/${RUNDECK_DEB_FILE}
ARG TINI_VERSION=v0.18.0

# create the non-root user and group and set MOTD login message
RUN groupadd --system -g ${USER_GROUP_ID} ${USER_GROUP} && \
    useradd --system --create-home --home-dir ${USER_HOME} --no-log-init -g ${USER_GROUP_ID} -u ${USER_ID} ${USER}

# Init.d script
COPY entry.sh /entry.sh
# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini && \
    chmod +x /entry.sh && \
    chown ${USER}:${USER_GROUP} /entry.sh

# install required packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl \
    netcat \
    # Install Rundeck
    apt-transport-https \
    ca-certificates \
    wget \
    dirmngr \
    gnupg \
    software-properties-common \
    libedit2 \
    libxmuu1 \
    openssh-client \
    uuid-runtime \
    xauth && \
    mkdir -p /usr/share/man/man1 && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ buster main" > /etc/apt/sources.list.d/adoptopenjdk.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends adoptopenjdk-8-hotspot && \
    wget --no-check-certificate  ${RUNDECK_SERVER_DIST_URL} && \
    dpkg -i ${RUNDECK_DEB_FILE}

# delete caches, files
RUN rm -f ${RUNDECK_DEB_FILE} && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove

# set the user and work directory
USER ${USER_ID}
WORKDIR ${USER_HOME}

# expose ports
EXPOSE 4440

#ENTRYPOINT ["/tini", "--"]
#
## Run your program under Tini
CMD ["/etc/init.d/rundeckd", "start", "&&", "tail", "-F", "/var/log/rundeck/service.log"]

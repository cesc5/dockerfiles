FROM sonarqube:7.9.2-community

LABEL Mantainer='DevOps Team'
LABEL Description="Sonarqube - Continuously inspecting the Code Quality"
LABEL Version="7.9.2-community"
 
ARG PLUGIN_PATH='/opt/sonarqube/extensions/plugins'
ARG PLUGIN_AUTH_VERSION='1.1.0'
ARG PLUGIN_AUTH='sonar-auth-oidc-plugin-1.1.0.jar'

USER root

RUN apt-get update && \
    apt-get install -y \
            wget

RUN cd ${PLUGIN_PATH} && \
    wget "https://github.com/vaulttec/sonar-auth-oidc/releases/download/v${PLUGIN_AUTH_VERSION}/${PLUGIN_AUTH}" && \
    chown -R sonarqube:sonarqube "${PLUGIN_AUTH}" && \
    # Remove apt cache
    rm -rf /var/lib/apt/lists/*

USER sonarqube

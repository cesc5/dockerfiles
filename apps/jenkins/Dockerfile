FROM jenkins/jenkins:2.204.2-centos

LABEL Mantainer='DevOps Team'
LABEL Description="Jenkins - Continous Integration"
LABEL Version="2.204.2-centos"

USER root

RUN rm -f /etc/localtime && \
	ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime && \
	apt-get update && \
    apt-get install -y \
            rsync && \
	# Remove apt cache
    rm -rf /var/lib/apt/lists/*

USER jenkins

COPY configs/plugins.txt /var/jenkins_home/plugins.txt

# Install missing plugins
RUN rm -rf /usr/share/jenkins/ref/plugins/*.lock && \ 
	/usr/local/bin/install-plugins.sh < /var/jenkins_home/plugins.txt
  

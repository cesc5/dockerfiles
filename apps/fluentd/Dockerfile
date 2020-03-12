FROM fluentd:v1.6.2-debian-1.0

LABEL MANTEINER "DevOps Team"
LABEL Description="Fluentd Log Collector"
LABEL Version="1.6.2"

USER root

RUN fluent-gem install fluent-plugin-elasticsearch && \
    mkdir /var/log/td-agent && \
    chown -R fluent:fluent /var/log/td-agent

EXPOSE 24224 5140

USER fluent
CMD ["fluentd"]

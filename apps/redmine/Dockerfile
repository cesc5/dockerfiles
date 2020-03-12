FROM redmine:3.4.12

LABEL Mantainer='DevOps Team'
LABEL Description="redmine - "
LABEL Version="3.4.12"

WORKDIR  /usr/src/redmine/

RUN apt-get update && \
    apt-get install -y \
            iputils-ping \
            netcat \
            unzip && \
    # needed for redmine_openid_connect
    gem install httparty -v 0.16.3

COPY plugins/redmine_agile-1_5_1-light.zip plugins/
COPY plugins/redmine_openid_connect-0_9_2.zip plugins/

RUN cd plugins && \
    unzip redmine_agile-1_5_1-light.zip && \
    rm -f redmine_agile-1_5_1-light.zip && \
    unzip redmine_openid_connect-0_9_2.zip && \
    rm -f redmine_openid_connect-0_9_2.zip && \
    bundle install --without development test --no-deployment

## After create a container, execute a migration for every plugin
## bundle exec rake redmine:plugins NAME=redmine_agile RAILS_ENV=production
## bundle exec rake redmine:plugins:migrate NAME=redmine_openid_connect RAILS_ENV=production

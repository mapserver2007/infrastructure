FROM ruby:2.2.3

RUN mkdir /root/ansible /root/secret_keys
WORKDIR /root/ansible

RUN apt-get update \
  && apt-get install -y sudo gcc git python-dev python-setuptools python-pip \
  && pip install markupsafe ansible \
  && gem install bundler rspec rspec_junit_formatter

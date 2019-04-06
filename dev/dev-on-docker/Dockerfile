FROM centos:7

ADD ansible /workspace
WORKDIR /workspace
RUN yum update -y && yum install ansible -y && yum clean all && \
  ansible-playbook setup/setup.yml -c local

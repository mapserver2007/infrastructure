FROM centos:centos7
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD ansible /root/ansible
WORKDIR /root/ansible

RUN yum -y install sudo
RUN yum -y install gcc
RUN yum -y install git
RUN yum -y install python-devel
RUN yum -y install python-setuptools
RUN yum -y install epel-release
RUN yum -y install python-pip
RUN pip install ansible
RUN ansible-playbook -i "localhost," setup.yml

EXPOSE 80
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]

FROM centos:centos7
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN yum -y install tar
RUN yum -y install gcc
RUN yum -y install python-devel
RUN yum -y install python-setuptools
RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum -y install python-pip
RUN pip install ansible

ADD ansible /root/ansible

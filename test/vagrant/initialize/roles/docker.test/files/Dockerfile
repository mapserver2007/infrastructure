FROM centos:centos6
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

# install package
# RUN yum -y update
RUN yum -y install passwd openssh openssh-server openssh-clients sudo
RUN yum -y install httpd

# create docker user and ssh key
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN echo 'root:root' | chpasswd
RUN /etc/init.d/sshd start

# supervisor
RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf

# Other Dockerfile directives are still valid
EXPOSE 22 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

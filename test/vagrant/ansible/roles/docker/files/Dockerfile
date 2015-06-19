FROM centos:centos6
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN yum -y update

# install package
RUN yum -y install vim git
RUN yum -y install passwd openssh openssh-server openssh-clients sudo

## Set up SSH
RUN /usr/bin/ssh-keygen -f /home/docker/.ssh/id_rsa -N docker

# setup sudoers
RUN echo 'root:root' |chpasswd

# Set up SSHD config
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

RUN /usr/bin/ansible-playbook setup.yml -c local

RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

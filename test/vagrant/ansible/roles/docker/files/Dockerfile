FROM centos:centos6
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

# install package
# RUN yum -y update
RUN yum -y install passwd openssh openssh-server openssh-clients sudo

# create docker user and ssh key
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN echo 'root:root' | chpasswd
RUN /etc/init.d/sshd start

# Run Ansible to configure the Docker image
RUN /usr/bin/ansible-playbook setup.yml -c local

# Other Dockerfile directives are still valid
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

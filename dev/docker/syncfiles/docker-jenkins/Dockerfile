FROM jenkins/jenkins:lts-alpine

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN curl -s -o /tmp/jenkins-backup.sh https://raw.githubusercontent.com/sue445/jenkins-backup-script/master/jenkins-backup.sh
RUN chmod +x /tmp/jenkins-backup.sh
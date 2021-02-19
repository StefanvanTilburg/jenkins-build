FROM jenkins/jenkins:2.271-jdk11

USER root
RUN apt-get update
RUN curl -fsSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
RUN newgrp docker
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
FROM jenkins/jenkins:2.182

COPY plugins.txt /user/share/jenkins/ref/plugins.txt
RUN /user/local/bin/install-plugin.sh < /user/share/jenkins/ref/plugin.txt

ENV JAVA_OPTS ~Djenkins.install.runSetupWizard=false

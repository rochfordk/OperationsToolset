FROM centos:centos7
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Prerequisites
RUN yum -y install openssh-server initscripts

# Install Supervisor for process management
ADD scripts/install-supervisor.sh /tmp/
RUN chmod +x /tmp/install-supervisor.sh
RUN /tmp/install-supervisor.sh
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#RUN rpm -Uvh http://archive.linux.duke.edu/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

#Sensu - Install
ADD files/sensu.repo /etc/yum.repos.d/sensu.repo
RUN yum install -y sensu
# add folder for PID file
RUN mkdir /var/run/sensu

#Sensu - Config
ADD /files/config.json /etc/sensu/config.json
ADD /files/prepare_config.sh /etc/sensu/prepare_config.sh
RUN chmod a+x /etc/sensu/prepare_config.sh

#Sensu - Dashboard (Uchiwa)
RUN yum install -y uchiwa

#Sensu - Dashboard - Config
ADD /files/uchiwa.json /etc/sensu/uchiwa.json

# Setup networking & ports
EXPOSE 22 8080 4567 3000

# Start the Services
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
 

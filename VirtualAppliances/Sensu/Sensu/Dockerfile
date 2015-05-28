FROM centos:centos7
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Prerequisites
RUN yum -y install openssh-server initscripts

# Install Supervisor for process control
ADD scripts/install-supervisor.sh /tmp/
RUN chmod +x /tmp/install-supervisor.sh
RUN /tmp/install-supervisor.sh
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install the services for this VirtualAppliance
#RUN curl -s https://fedoraproject.org/static/217521F6.txt -o /tmp/217521F6.txt
#RUM rpm --import /tmp/217521F6.txt
#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#RUN yum -y install nagios nagios-plugins-all nagios-plugins-nrpe nrpe php httpd
#ADD conf/http_passwd /etc/nagios/passwd

# Sensu
#ADD scripts/install-sensu.sh /tmp/
#RUN chmod +x /tmp/install-sensu.sh
#RUN /tmp/install-sensu.sh
#RUN date
#RUN ls /tmp
# ADD conf/http_passwd /etc/nagios/passwd
# Password12

#RUN rpm -Uvh http://archive.linux.duke.edu/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

#Sensu - Install
ADD files/sensu.repo /etc/yum.repos.d/sensu.repo
RUN yum install -y sensu

#Sensu - Config
ADD /files/config.json /etc/sensu/config.json

#Sensu - Dashboard (Uchiwa)
RUN yum install -y uchiwa

#Sensu - Dashboard - Config
ADD /files/uchiwa.json /etc/sensu/uchiwa.json

# Setup networking & ports
EXPOSE 22 8080 4567 3000

# Start the Services
#CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
 

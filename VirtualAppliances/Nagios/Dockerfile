FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Prerequisites
RUN yum -y install openssh-server

# Install Supervisor for process control
ADD scripts/install-supervisor.sh /tmp/
RUN chmod +x /tmp/install-supervisor.sh
RUN /tmp/install-supervisor.sh
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install the services for this VirtualAppliance
RUN curl -s https://fedoraproject.org/static/217521F6.txt -o /tmp/217521F6.txt
RUM rpm --import /tmp/217521F6.txt
#RUN curl -s https://fedoraproject.org/static/217521F6.txt | rpm --import add
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install nagios nagios-plugins-all nagios-plugins-nrpe nrpe php httpd
ADD conf/http_passwd /etc/nagios/passwd
# Password12

# Setup networking & ports
EXPOSE 80 22

# Start the Services
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

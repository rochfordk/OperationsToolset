FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Install the services for this VirtualAppliance
# MySql
RUN yum -y install mysql-client mysql-server

# change the bind address to 0.0.0.0
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/my.cnf
  
ADD scripts/startup.sh /opt/startup.sh
    
# Setup networking & ports
EXPOSE 3306 22

# Start the Services    
CMD ["/bin/bash", "/opt/startup.sh"]

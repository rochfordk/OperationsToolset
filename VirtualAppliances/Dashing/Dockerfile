FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Update
RUN yum -y update


# Install prerequisite dev libraries
RUN yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel 
RUN yum -y install libyaml-devel libffi-devel openssl-devel make 
RUN yum -y install bzip2 autoconf automake libtool bison iconv-devel
RUN yum -y install which tar

# Install the EPEL package (required by RVM)
RUN curl -s https://fedoraproject.org/static/217521F6.txt -o /tmp/217521F6.txt
RUN rpm --import /tmp/217521F6.txt
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install RVM (Ruby Version Manager)
RUN curl -L get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh

# Setup RVM environment
# Install required Ruby version
RUN rvm install 1.9.3

# Install Dashing
gem install dashing

# Install SSH for test
#RUN yum install -y openssh-server
#RUN mkdir /var/run/sshd
#RUN /usr/bin/ssh-keygen -A 
#RUN echo 'root:secret' |chpasswd

#EXPOSE 22
CMD    ["/bin/bash"]

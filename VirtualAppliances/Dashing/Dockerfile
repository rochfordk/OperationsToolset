FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Update
RUN yum -y update

# Install Supervisor for process control
ADD scripts/install-supervisor.sh /tmp/
RUN chmod +x /tmp/install-supervisor.sh
RUN /tmp/install-supervisor.sh
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# start script for dashing
ADD scripts/dashing-start.sh /tmp/
RUN chmod +x /tmp/dashing-start.sh

# Install prerequisite dev libraries
RUN yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel 
RUN yum -y install libyaml-devel libffi-devel openssl-devel make 
RUN yum -y install bzip2 autoconf automake libtool bison iconv-devel
RUN yum -y install which tar git

# Install the EPEL package (required by RVM)
RUN curl -s https://fedoraproject.org/static/217521F6.txt -o /tmp/217521F6.txt
RUN rpm --import /tmp/217521F6.txt
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install RVM (Ruby Version Manager)
RUN curl -L get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
ENV PATH /usr/local/rvm/bin:/usr/local/rvm/rubies/ruby-1.9.3-p547/bin:$PATH

# Setup RVM environment
# Install required Ruby version
RUN rvm install 1.9.3
#RUN /usr/local/rvm/bin/rvm install 1.9.3

# Install Dashing
RUN gem install execjs
#RUN gem install therubyracer --platform=ruby
RUN gem install dashing

# couldn't get therubyracer to work (rvm incompatibility?) so using Node from EPEL:
RUN yum -y install nodejs

# Install the dashboard
RUN git clone https://github.com/rochfordk/dashing-openstack.git
RUN cd dashing-openstack && /usr/local/rvm/rubies/ruby-1.9.3-p547/lib/ruby/gems/1.9.1/gems/bundler-1.6.2/bin/bundle

EXPOSE 3030
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
#CMD    ["/bin/bash cd dashing-openstack && dashing start"]
#CMD    ["/bin/bash"]

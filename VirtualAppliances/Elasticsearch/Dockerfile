#
# ElasticSearch Dockerfile
#

FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Install the services for this VirtualAppliance

# deps
RUN yum update -y
RUN yum install -y wget java-1.6.0-openjdk.x86_64

# Install ElasticSearch.
RUN cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz
RUN cd /tmp && tar xvzf elasticsearch-1.1.1.tar.gz && rm -f elasticsearch-1.1.1.tar.gz
RUN mv /tmp/elasticsearch-1.1.1 /elasticsearch

# Configure
ADD data/elasticsearch.yaml /elasticsearch/config/

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
#ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]

RUN apt-get install -y openssh-server


# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 22
EXPOSE 9200
EXPOSE 9300

CMD /usr/sbin/sshd -D

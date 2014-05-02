#
# ElasticSearch Dockerfile
#

FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Install the services for this VirtualAppliance

# Update
RUN yum update -y

# Install Java
RUN yum install -y wget java-1.7.0-openjdk.x86_64
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk.x86_64
ENV PATH $JAVA_HOME/bin:$PATH

# Install ElasticSearch.
RUN cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz
RUN cd /tmp && tar xvzf elasticsearch-1.1.1.tar.gz && rm -f elasticsearch-1.1.1.tar.gz
RUN mv /tmp/elasticsearch-1.1.1 /elasticsearch

# Configure
ADD conf/elasticsearch.yaml /elasticsearch/config/

# Define mountable directories.
#VOLUME ["/data"]

# Define working directory.
#WORKDIR /data



#RUN yum install -y openssh-server


# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
#EXPOSE 22
EXPOSE 9200
EXPOSE 9300

#CMD /bin/bash echo "my output"
#cmd /elasticsearch/bin/elasticsearch

# Define default command.
ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]

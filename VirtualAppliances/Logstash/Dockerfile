FROM centos

MAINTAINER Keith Rochford <keith_rochford@dell.com>

# Install the services for this VirtualAppliance
# Logstash
#RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list
RUN yum update -y

RUN yum install -y wget java-1.7.0-openjdk.x86_64
#RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar -O /opt/logstash.jar --no-check-certificate
#RUN wget http://logstash.objects.dreamhost.com/release/logstash-1.1.13-flatjar.jar -O /opt/logstash.jar --no-check-certificate

RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.0.tar.gz -O /opt/logstash-1.4.0.tar.gz --no-check-certificate
RUN tar zxvf /opt/logstash-1.4.0.tar.gz -C /opt/

=======

RUN yum install -y wget java-1.6.0-openjdk.x86_64
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4-flatjar.jar -O /opt/logstash.jar --no-check-certificate


ADD scripts/run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
#RUN rm -rf /tmp/*

EXPORT 80
EXPOSE 514
EXPOSE 9200
EXPOSE 9292
EXPOSE 9300
CMD ["/usr/local/bin/run"]

FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

ADD install-nagios.sh /tmp/
RUN /tmp/install-nagios.sh

EXPOSE 80
ADD start.sh /tmp/start.sh
CMD /tmp/start.sh
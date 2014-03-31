FROM centos
MAINTAINER Keith Rochford <keith_rochford@dell.com>

#RUN echo "installing openSSH on centos"
#RUN apt-get install -y sudo openssh-server
#RUN echo "i'm bored now"

ADD install-nagios.sh /tmp/
RUN /tmp/install-nagios.sh

#EXPOSE 15672:15672
#EXPOSE 8080
#ADD start.sh /tmp/start.sh
#CMD /tmp/start.sh
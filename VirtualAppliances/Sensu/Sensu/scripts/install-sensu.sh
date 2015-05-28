#!/bin/bash
# INSTALL SENSU

# Sensu server
#ADD ./files/sensu.repo /etc/yum.repos.d/
yum install -y sensu
#ADD ./files/config.json /etc/sensu/
#RUN mkdir -p /etc/sensu/ssl
#RUN cp /joemiller.me-intro-to-sensu/client_cert.pem /etc/sensu/ssl/cert.pem
#RUN cp /joemiller.me-intro-to-sensu/client_key.pem /etc/sensu/ssl/key.pem

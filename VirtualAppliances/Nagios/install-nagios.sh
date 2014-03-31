#!/bin/bash
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum -y install nagios nagios-plugins-all nagios-plugins-nrpe nrpe php httpd


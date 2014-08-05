#!/bin/bash
# INSTALL NAGIOS

# prerequisites
yum -y install gcc perl

# Creating the nagios user
/usr/sbin/useradd -m nagios
/usr/sbin/usermod -L nagios
/usr/sbin/useradd -m apache
/usr/sbin/usermod -L apache
 
# Creating a group to be able to use external commands
/usr/sbin/groupadd nagcmd
/usr/sbin/usermod -G nagios,nagcmd nagios
/usr/sbin/usermod -G nagios,nagcmd apache

#curl -s https://fedoraproject.org/static/217521F6.txt -o /tmp/217521F6.txt
#rpm --import /tmp/217521F6.txt
#rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#yum -y install nagios nagios-plugins-all nagios-plugins-nrpe nrpe


 
# Download & Compile
cd /usr/local/src/
wget -N http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-3.4.4.tar.gz
tar -xzf nagios-3.4.4.tar.gz
cd nagios
 
./configure --prefix=/usr/local/nagios --with-command-group=nagcmd --enable-nanosleep --enable-event-broker
make all
make install
make install-init
make install-commandmode
make install-config
#chkconfig nagios on
#service nagios start
#

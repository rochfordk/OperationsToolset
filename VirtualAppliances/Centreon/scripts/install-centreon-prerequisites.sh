#!/bin/bash
# INSTALL CENTREON PREREQUISITES

# install RPMForge
# for details visit this website: http://wiki.centos.org/AdditionalResources/Repositories/RPMForge
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
 
uname -i
# for me 'x86_64' is the result so I'll choose the x86_64 version
#wget -N http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
wget -N http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -i rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
  
# Installing Apache2 + PHP
yum -y install httpd php php-mysql php-gd
usermod -U apache
chkconfig httpd on
# Set your timezone in php.ini to get rid of an ugly warinng in the future.
# find date.timezone at the [date] section, uncomment and set it. for me it's Europe/Bucharest
# date.timezone = Europe/Bucharest
# find yours here: http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/timezone.html
#vim /etc/php.ini
#

# Add port 80 to Firewall
sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo service iptables save
 
 
# Installing GD modules
yum -y install gd fontconfig-devel libjpeg-devel libpng-devel gd-devel perl-GD
 
# Installing MySQL
yum -y install openssl-devel perl-DBD-MySQL mysql-server mysql-devel
 
# Installing PHP Dependencies
yum -y install php-ldap php-xml php-mbstring
 
# Installing DBI modules
yum -y install perl-DBI perl-DBD-MySQL
 
# Installing PERL modules
yum -y install perl-Config-IniFiles
 
# Installing RRDTools
yum -y install rrdtool perl-rrdtool
 
# Installing SNMP
yum -y install perl-Crypt-DES perl-Digest-SHA1 perl-Digest-HMAC net-snmp-utils
yum -y install perl-Socket6 perl-IO-Socket-INET6 net-snmp net-snmp-libs php-snmp dmidecode lm_sensors perl-Net-SNMP net-snmp-perl
 
# Misc
yum -y install fping cpp gcc gcc-c++ libstdc++ glib2-devel
# Make is not included on cent-os by default
yum -y install make
 
# PEAR
yum -y install php-pear
pear channel-update pear.php.net
# for those who have a web proxy
# pear config-set http_proxy http://my_proxy.com:port
pear upgrade-all
 
 
# add the line rocommunity public 127.0.0.1/32 to snmpd.conf
sed -i '$ a\rocommunity public 127.0.0.1/32' /etc/snmp/snmpd.conf
service snmpd start
chkconfig snmpd on
# enabling NTP couldn't hurt
chkconfig ntpd on
ntpdate pool.ntp.org
service ntpd start
# 

# prepare for install
service httpd start
groupadd centreon
useradd -g centreon centreon
cd /usr/local/src/
wget http://download.centreon.com/index.php?id=4264
 
tar -zxf centreon-2.4.0.tar.gz
cd centreon-2.4.0
export PATH="$PATH:/usr/local/nagios/bin/"


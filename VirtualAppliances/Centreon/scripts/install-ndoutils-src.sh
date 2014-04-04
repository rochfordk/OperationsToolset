#!/bin/bash
#

# prerequisites
yum -y install gcc

# download the tar file
cd /usr/local/src
wget -N http://sourceforge.net/projects/nagios/files/ndoutils-1.x/ndoutils-1.5.2/ndoutils-1.5.2.tar.gz/download
tar -zxvf ndoutils-1.5.2.tar.gz
cd ndoutils-1.5.2
 
# get the patch and apply it; wget to same folder as ndoutils
wget -N http://svn.centreon.com/trunk/ndoutils-patch/ndoutils1.5.2_light.patch
yum -y install patch
patch -p1 -N < ndoutils1.5.2_light.patch
 
# continue installation
./configure --prefix=/usr/local/nagios/ --enable-mysql --with-ndo2db-user=nagios --with-ndo2db-group=nagios
make
 
 
# After creating the binaries and libraries they have to be copied
cp -f ./src/ndomod-3x.o /usr/local/nagios/bin/ndomod.o
cp -f ./src/ndo2db-3x /usr/local/nagios/bin/ndo2db
cp -f ./config/ndo2db.cfg-sample /usr/local/nagios/etc/ndo2db.cfg
cp -f ./config/ndomod.cfg-sample /usr/local/nagios/etc/ndomod.cfg
chmod 774 /usr/local/nagios/bin/ndo*
chown nagios:nagios /usr/local/nagios/bin/ndo*
 
# make ndo2db daemon autorun
#cp -f ./daemon-init /etc/init.d/ndo2db
#chmod +x /etc/init.d/ndo2db
#chkconfig ndo2db on
#

#!/bin/bash

# Install Supervisor for process control 
yum -y install python-setuptools
easy_install pip
pip install supervisor

mkdir -p /var/log/supervisord
mkdir -p /var/run/supervisord


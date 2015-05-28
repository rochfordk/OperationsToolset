#!/bin/bash
chkconfig httpd on && chkconfig nagios on
service httpd start && service nagios start
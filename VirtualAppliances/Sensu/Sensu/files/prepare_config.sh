#!/bin/bash
RABBIT_HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
REDIS_HOST_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
sed -i.bak s/rabbit_host_ip/$RABBIT_HOST_IP/ $1
sed -i.bak s/redis_host_ip/$REDIS_HOST_IP/ $1
exit 0

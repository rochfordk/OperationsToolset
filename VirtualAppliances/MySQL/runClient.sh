#!/bin/sh

TAG="rochfordk/mysql"

CONTAINER_ID=$(sudo docker ps | grep $TAG | awk '{print $1}')

IP=$(sudo docker inspect $CONTAINER_ID | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]')

mysql -u admin -p -h $IP

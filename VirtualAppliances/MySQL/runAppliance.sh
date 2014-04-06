#!/bin/bash
sudo docker run -d -p 22 -p 3306 -v /data/mysql:/var/lib/mysql rochfordk/mysql

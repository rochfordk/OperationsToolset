#!/bin/bash
sudo docker run -d -p 80 -p 514 -p 9200 -p 9292 -p 9300 -e "ES_HOST=172.17.0.2" -e "ES_PORT=9300" rochfordk/logstash

#!/bin/bash
sudo docker run -d -p 514 -p 9200 -p 9292 -p 9300 rochfordk/logstash

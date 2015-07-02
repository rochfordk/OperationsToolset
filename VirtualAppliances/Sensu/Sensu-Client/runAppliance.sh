#!/bin/bash
sudo docker run -p 22:22 -p 4567:4567 -p 3000:3000 -p 8080:8080 -t -i rochfordk/sensu

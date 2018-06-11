#!/bin/bash

BASE_DIR="$(pwd)"

docker rm -f alastria
docker run -ti \
-v $BASE_DIR/data:/root/alastria \
-p 9000:9000 \
-p 21000:21000 \
-p 21000:21000/udp \
-p 22000:22000 \
-p 41000:41000 \
-p 8443:8443 \
--name alastria \
brunneis/alastria

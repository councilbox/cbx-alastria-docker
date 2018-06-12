#!/bin/bash
BASE_DIR="$(pwd)"
docker rm -f alastria
docker run -tid \
-v $BASE_DIR/alastria-node:/root/alastria \
-p 21000:21000 \
-p 21000:21000/udp \
-p 22000:22000 \
-p 9000:9000 \
-p 8443:8443 \
--name alastria \
brunneis/alastria

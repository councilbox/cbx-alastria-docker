#!/bin/bash
docker rm -f alastria
docker run -ti \
-v "$(pwd)"/alastria-data:/root/alastria \
-p 9000:9000 \
-p 21000:21000 \
-p 21000:21000/udp \
-p 22000:22000 \
-p 41000:41000 \
--name alastria \
brunneis/alastria

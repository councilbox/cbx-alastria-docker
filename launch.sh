#!/bin/bash
source env.sh
docker pull $DOCKER_IMAGE
docker run -tid \
-v $DATA_DIR:/root/alastria \
-p 21000:21000 \
-p 21000:21000/udp \
-p 22000:22000 \
-p 9000:9000 \
-p 8443:8443 \
--restart always \
--ulimit nofile=10000 \
--name $NODE_NAME \
-e NODE_TYPE=$NODE_TYPE \
-e NODE_NAME=$NODE_NAME \
$@ \
$DOCKER_IMAGE

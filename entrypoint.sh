#!/bin/bash
NODE_TYPE=$1
NODE_NAME=$2

# Backup mode if the identity exists
if [ ! -f ~/alastria/data/IDENTITY ]; then
    ./init.sh auto $NODE_TYPE $NODE_NAME
elif [ ! -f ~/alastria/data/DOCKER_VERSION_$DOCKER_VERSION ]; then
    ./init.sh backup $NODE_TYPE $NODE_NAME \
    && (rm -f ~/alastria/data/DOCKER_VERSION_* 2> /dev/null; \
        touch ~/alastria/data/DOCKER_VERSION_$DOCKER_VERSION)
fi

./monitor.sh start
exec ./start.sh --watch

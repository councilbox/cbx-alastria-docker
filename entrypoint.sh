#!/bin/bash
NODE_TYPE=$1
NODE_NAME=$2

# Backup mode if the identity exists
if [ ! -f ~/alastria/data/IDENTITY ]; then
    ./init.sh auto $NODE_TYPE $NODE_NAME
elif [ ! -f ~/alastria/data/INITIALIZED ]; then
    ./init.sh backup $NODE_TYPE $NODE_NAME && touch ~/alastria/data/INITIALIZED
fi

./monitor.sh start
exec ./start.sh --watch

#!/bin/bash
NODE_NAME=REG_brunneis_TestNet_2_4_00
cd /opt/alastria/scripts

# Backup mode if the identity exists
if [ ! -f ~/alastria/data/IDENTITY ]; then
    ./init.sh auto general $NODE_NAME
elif [ ! -f ~/alastria/data/INITIALIZED ]; then
    ./init.sh backup general $NODE_NAME && touch ~/alastria/data/INITIALIZED
fi

# Build the monitor the first time
if [ ! -f ~/MONITOR ]; then
    ./monitor.sh build && touch ~/MONITOR
fi

./start.sh
./monitor.sh start

exec bash --login -i

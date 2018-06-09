#!/bin/bash
NODE_NAME=REG_brunneis_TestNet_2_4_00

if [ ! -f ~/alastria/data/IDENTITY ]; then
    ./init.sh auto general $NODE_NAME
else
    ./init.sh backup general $NODE_NAME
fi

./start.sh
./monitor.sh start

exec bash --login -i

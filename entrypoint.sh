#!/bin/bash
NODE_NAME=brunneis
if [ ! -f ~/alastria/data/IDENTITY ]; then
    init.sh auto general $NODE_NAME
fi
init.sh backup general $NODE_NAME
exec start.sh

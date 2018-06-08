#!/bin/bash
if [ ! -f ~/alastria/data/IDENTITY ]; then
    init.sh auto general brunneis
fi
exec start.sh

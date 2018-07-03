#!/bin/bash
DATA_DIR="$(cat DATA_DIR 2> /dev/null)"
WORK_DIR="$(pwd)"/alastria-node
DATA_DIR=${DATA_DIR:-$WORK_DIR}
ARCHIVE=$(cat NODE_NAME)_$(date +%Y%m%d%H%M%S).xz
CUID=$UID
./stop.sh 2> /dev/null; sleep 5
mkdir -p backups; cd backups
sudo tar cvzf $ARCHIVE $DATA_DIR && sudo chown $CUID:$CUID $ARCHIVE \
&& cd .. && ./start.sh 2> /dev/null

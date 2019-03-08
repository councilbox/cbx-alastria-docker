#!/bin/bash
source env.sh
docker exec -ti $NODE_NAME bash -c "cd /opt/alastria-node/scripts && ./stop.sh && ./monitor.sh stop"
docker stop $NODE_NAME

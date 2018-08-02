#!/bin/bash
docker exec -ti alastria bash -c "cd /opt/alastria-node/scripts && ./stop.sh && ./monitor.sh stop"
docker stop alastria

#!/bin/bash
docker exec -ti alastria bash -c "cd /opt/alastria/scripts && ./stop.sh && ./monitor.sh stop"
docker stop alastria

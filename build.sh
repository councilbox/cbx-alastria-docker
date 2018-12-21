#!/bin/bash
docker build \
--build-arg DOCKER_VERSION=latest \
--build-arg MONITOR_ENABLED=1 \
-t councilbox/alastria-node:latest-monitor .

docker build \
--build-arg DOCKER_VERSION=latest \
-t councilbox/alastria-node:latest .

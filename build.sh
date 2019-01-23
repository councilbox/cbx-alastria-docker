#!/bin/bash
docker build \
--build-arg DOCKER_VERSION=latest \
-t councilbox/alastria-node:latest .

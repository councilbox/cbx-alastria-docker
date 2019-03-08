#!/bin/bash
source env.sh
docker pull $DOCKER_IMAGE
./destroy.sh
./launch.sh

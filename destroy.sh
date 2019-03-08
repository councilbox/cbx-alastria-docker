#!/bin/bash
source env.sh
./stop.sh && docker rm -f $NODE_NAME

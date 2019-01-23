#!/bin/bash
sleep 60
version=$(curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":67}' http://localhost:22000)
while(true); do
  if [ ! $version ]; then
      kill $(ps -aux | awk '{print $2}' | tr " " "\n" | tail -n +2)
  fi
  sleep 1
done

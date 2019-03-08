#!/bin/bash
sleep 60
connected=$(curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":67}' http://localhost:22000)
while(true); do
  stuck=$(cat ~/alastria/logs/$(ls -t1 ~/alastria/logs | grep quorum | head -1) | tail -1 | grep "retrieved hash chain is invalid")
  if [ ! $connected -o "$stuck" ]; then
      kill $(ps -aux | awk '{print $2}' | tr " " "\n" | tail -n +2)
  fi
  sleep 5
done

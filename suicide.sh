#!/bin/bash
is_stuck () {
  cat ~/alastria/logs/$(ls -t1 ~/alastria/logs | grep quorum | head -1) | tail -1 | grep "$1"
}

is_connected () {
  curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":67}' http://localhost:22000
}

sleep 60
while(true); do
  if [ ! $(is_connected) -o "$(is_stuck "retrieved hash chain is invalid")" -o "$(is_stuck "too many open files")" ]; then
      kill $(ps -aux | awk '{print $2}' | tr " " "\n" | tail -n +2)
  fi
  sleep 5
done

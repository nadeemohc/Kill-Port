#!/bin/bash
# killport.sh
PORT=$1

if [ -z "$PORT" ]; then
  echo "Usage: ./killport.sh <port>"
  exit 1
fi

PIDS=$(sudo lsof -t -i :$PORT)
if [ -z "$PIDS" ]; then
  echo "No process is using port $PORT"
else
  echo "Killing process(es) on port $PORT: $PIDS"
  sudo kill -9 $PIDS
fi

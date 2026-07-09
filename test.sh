#!/usr/bin/env bash
set -euo pipefail

echo "Starting app for testing..."
node server.js &
APP_PID=$!
sleep 2

echo "Testing /health endpoint..."
RESPONSE=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:3000/health)

kill "$APP_PID"

if [[ "$RESPONSE" == "200" ]]; then
  echo "Test passed: health endpoint returned 200"
  exit 0
else
  echo "Test failed: health endpoint returned $RESPONSE"
  exit 1
fi

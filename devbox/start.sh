#!/bin/bash

CODE_SERVER_PID=0

sigterm_handler() {
  kill -TERM ${CODE_SERVER_PID}
  wait ${CODE_SERVER_PID}
}

trap 'sigterm_handler' TERM

code-server serve-local --host 0.0.0.0 --port 8000 --without-connection-token --accept-server-license-terms &
CODE_SERVER_PID=$!

wait ${CODE_SERVER_PID}

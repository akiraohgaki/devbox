#/bin/bash

CMD='sleep infinity'
#CMD='code tunnel'
#CMD='openvscode-server --host 0.0.0.0 --port 3000 --without-connection-token'

CMD_PID=0

sigterm_handler() {
  kill -TERM ${CMD_PID}
  wait ${CMD_PID}
}

trap 'sigterm_handler' TERM

${CMD} &

CMD_PID=$!

wait ${CMD_PID}

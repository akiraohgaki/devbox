#/bin/bash

CMD='sleep infinity'

CMD_PID=0

sigterm_handler() {
  kill -TERM ${CMD_PID}
  wait ${CMD_PID}
}

trap 'sigterm_handler' TERM

${CMD} &

CMD_PID=$!

wait ${CMD_PID}

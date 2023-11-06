#/bin/bash

CMD='sleep infinity'
#CMD='code tunnel'
#CMD='code serve-web --host 0.0.0.0 --port 8000 --without-connection-token --accept-server-license-terms'

CMD_PID=0

sigterm_handler() {
  kill -TERM ${CMD_PID}
  wait ${CMD_PID}
}

trap 'sigterm_handler' TERM

${CMD} &

CMD_PID=$!

wait ${CMD_PID}

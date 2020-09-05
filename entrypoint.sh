#!/bin/sh
# pull latest image version
if [ "$LAUNCH_PULL" = true ]; then
    echo "Pulling $LAUNCH_IMAGE: docker pull $LAUNCH_IMAGE"
    docker pull $LAUNCH_IMAGE
fi

# build launch parameters
DOCKER_ARGS="run --rm"
[ -n "$LAUNCH_CONTAINER_NAME" ] && DOCKER_ARGS="$DOCKER_ARGS --name $LAUNCH_CONTAINER_NAME"
[ "$LAUNCH_PRIVILEGED" = true ] && DOCKER_ARGS="$DOCKER_ARGS --privileged"
[ "$LAUNCH_INTERACTIVE" = true ] && DOCKER_ARGS="$DOCKER_ARGS -i"
[ "$LAUNCH_TTY" = true ] && DOCKER_ARGS="$DOCKER_ARGS -t"
[ "$LAUNCH_HOST_NETWORK" = true ] && DOCKER_ARGS="$DOCKER_ARGS --net host"
[ "$LAUNCH_PRIVILEGED" = true ] && DOCKER_ARGS="$DOCKER_ARGS --privileged"
DOCKER_ARGS="$DOCKER_ARGS $LAUNCH_ENVIRONMENT $LAUNCH_VOLUMES $LAUNCH_EXTRA_ARGS $LAUNCH_IMAGE"

echo "Running $LAUNCH_IMAGE: exec docker $DOCKER_ARGS"
exec docker run -t -p 6000:6000 -e VNC_SERVER_PASSWORD=password -e HELENA_PROGRAM_ID=5803 -e TIME_LIMIT_IN_HOURS=23 -e NUM_RUNS_ALLOWED_PER_WORKER=99  -e SCRIPT_PARAMS="url='https://newjersey.craigslist.org/search/apa?postedToday=1&bundleDuplicates=1&availabilityMode=0&sale_date=all+dates',container='container_name_worker'" --user apps --privileged schasins/helena:latest


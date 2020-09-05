# official Docker (CLI) image
FROM docker:latest

# launch parameters
ENV LAUNCH_IMAGE            schasins/helena:latest
ENV LAUNCH_PULL             true
ENV LAUNCH_CONTAINER_NAME=
ENV LAUNCH_PRIVILEGED       true
ENV LAUNCH_INTERACTIVE      false
ENV LAUNCH_TTY              true
ENV LAUNCH_HOST_NETWORK     true
ENV LAUNCH_ENVIRONMENT=
ENV LAUNCH_VOLUMES=
ENV LAUNCH_EXTRA_ARGS=

# add entrypoint.sh launcher script
ADD entrypoint.sh   /

# run the image
ENTRYPOINT /entrypoint.sh

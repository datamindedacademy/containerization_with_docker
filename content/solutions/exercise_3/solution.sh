
# Run the container
docker run -d --name easy-container devopsdockeruh/simple-web-service:ubuntu

# Log into the container with exec
docker exec -it easy-container /bin/bash
# Once inside: tail -f /usr/src/app/text.log

# Second method - This doesn't run the internal process generating logs into /usr/src/app/text.log
# because we overwrote the entrypoint to be /bin/bash instead.
docker run -it --entrypoint=/bin/bash devopsdockeruh/simple-web-service:ubuntu

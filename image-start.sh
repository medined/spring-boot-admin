#!/bin/bash

CONTAINER_NAME=sba
IMAGE=medined/spring-boot-admin:2.2.3

docker inspect -f '{{.State.Running}}' $CONTAINER_NAME > /dev/null 2>/dev/null
if [ $? == 0 ]; then
    echo "Eureka server already running."
else
    docker run \
    --name $CONTAINER_NAME \
    -it \
    --detach \
    --publish 8080:8080 \
    $IMAGE
fi

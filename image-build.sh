#!/bin/bash

IMAGE=medined/spring-boot-admin:2.2.3

./gradlew bootJar
docker build -t $IMAGE .

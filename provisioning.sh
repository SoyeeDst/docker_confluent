#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage : $0 docker-machine-name"
    exit
fi

docker-machine create --driver virtualbox --virtualbox-memory 6000 $1
if [ $? != 0 ]; then
    echo "Create docker-machine $1 failed"
    exit
fi

eval $(docker-machine env $1)
DOCKER_HOST_IP=`docker-machine ip $1`
export DOCKER_HOST_IP=$DOCKER_HOST_IP

docker-compose up -d
echo "Confluent Docker containers are up and running now on host $DOCKER_HOST_IP"

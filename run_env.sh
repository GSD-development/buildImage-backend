#!/bin/bash
docker stop frontend
docker rm frontend
IMAGE=iotapi322/buildimage:latest
#IMAGE=ubuntu:bionic
#
docker pull $IMAGE
docker run  \
  -it      --name "frontend" \
  -v `pwd`:/app/             \
  $IMAGE    \
  /bin/bash


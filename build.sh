#!/bin/bash
set -xe
source version.env
docker build -t "${CONTAINER_NAME}" .

docker tag "${CONTAINER_NAME}" "${CONTAINER_NAME_LATEST}"

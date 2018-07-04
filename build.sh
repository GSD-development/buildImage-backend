#!/bin/bash
set -xe
source version.env
docker build -t "${CONTAINER_NAME}" .

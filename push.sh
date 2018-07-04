#!/bin/bash

#
# Pass in the version tag you want me to push
#
set -xe
source version.env



if [ -z "$VERSION"  ]; then echo "I need the version of the container you want me to push"; fi


#
# This assumes you have already logged in...
#
docker push "$CONTAINER_NAME"

#!/bin/bash

set -e -u

# Build the image using the Dockerfile that's in the root of the repository
# which is accessible at the path ./src
docker build -t quay.io/tdonohue/hello-java:latest src/

# Push to our external image registry
docker push quay.io/tdonohue/hello-java:latest

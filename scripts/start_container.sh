#!/bin/bash
set -e

# Define the container name
CONTAINER_NAME="python-server-aws"

# Check if the container already exists
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    # If the container exists, stop and remove it
    docker stop "$CONTAINER_NAME"
    docker rm "$CONTAINER_NAME"
fi

# Pull the Docker image from Docker Hub
docker pull richeb/python-aws-code:latest

# Run the Docker image as a container
docker run -p 8000:8000 --name "$CONTAINER_NAME" richeb/python-aws-code python -m http.server

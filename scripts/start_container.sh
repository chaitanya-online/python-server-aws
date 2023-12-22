#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull richeb/python-aws-code:latest

# Run the Docker image as a container
docker stop python-server-aws
docker run -p 8000:8000 --name python-server-aws richeb/python-aws-code python -m http.server



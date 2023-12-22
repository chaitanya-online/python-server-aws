#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull richeb/python-aws-code:latest

# Run the Docker image as a container
# docker run -p 8000:8000 --name python-server-aws richeb/python-aws-code python -m http.server
docker run -p 8000:8000 --name python-server-aws --rm --restart always richeb/python-aws-code python -m http.server



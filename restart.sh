#!/bin/bash

# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <no_of_containers>"
    exit 1
fi

# Start the bot
cd ./app-viewer
docker-compose down
image_id=$(docker images | grep app | awk '{print $3}')
if [ -n "$image_id" ]; then
    docker rmi -f $image_id
    if [ $? -ne 0 ]; then
        echo "Failed to remove the image"
        exit 1
    fi
fi
docker-compose up --scale app=$1 -d

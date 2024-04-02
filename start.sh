#!/bin/bash

# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <no_of_containers>"
    exit 1
fi

# Start the bot
cd ../app-viewer
docker-compose up --scale app=$2 -d

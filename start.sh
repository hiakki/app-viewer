#!/bin/bash

# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <no_of_containers>"
    exit 1
fi

# Start the bot
docker-compose up --scale app=$1 -d

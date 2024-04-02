#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <user_name> <no_of_containers>"
    exit 1
fi

bash setup.sh
bash fetch_urls.sh $1
bash start.sh $2
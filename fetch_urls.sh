#!/bin/bash

# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <user_name>"
    exit 1
fi

# Extract all URLs
cd ./urls-extractor
python3 -m pip install -r requirements.txt
python3 main.py $1

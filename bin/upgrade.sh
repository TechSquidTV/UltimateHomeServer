#!/bin/bash

# Check if the .env file exists
if [ -f .env ]; then
    # Read the .env file line by line
    while read -r line || [[ -n "$line" ]]; do
        # Ignore commented empty lines
        if [[ -n $line && ! $line =~ ^# ]]; then
            # Export each variable
            export "$line"
        fi
    done < .env
else
    echo "Error: .env file not found"
    exit 1
fi

envsubst < secrets.yaml > secrets.yaml.tmp
sudo -E helm upgrade -f values.yaml -f secrets.yaml.tmp rackserver .
rm secrets.yaml.tmp

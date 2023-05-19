#!/usr/bin/env bash

source ./bin/loadenv.sh

if [ -z "$1" ]; then
    echo "Error: No depoyment specified"
    exit 1
fi

helm upgrade -f values.yaml -f <(envsubst < secrets.yaml) "$1" .

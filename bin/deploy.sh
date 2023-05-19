#!/usr/bin/env bash

source ./bin/loadenv.sh

if [ -z "$1" ]; then
    echo "Error: No depoyment specified"
    exit 1
fi

echo "The deployment script is only meant to be ran once. If you need to upgrade the deployment, use bin/upgrade.sh instead."
echo "Are you sure you want to continue? (y/n)"
read -r response
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    exit 0
fi

helm install "$1" ./ -f values.yaml -f <(envsubst < secrets.yaml)

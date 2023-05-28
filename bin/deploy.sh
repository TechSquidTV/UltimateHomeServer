#!/usr/bin/env bash


echo "The deployment script is only meant to be ran once. If you need to upgrade the deployment, use bin/upgrade.sh instead."
echo "Are you sure you want to continue? (y/n)"
read -r response
if [[ ! ${response,,} =~ ^y(es)?$ ]]; then
    exit 0
fi

helm install "$1" ./ -f values.yaml -f secrets.yaml

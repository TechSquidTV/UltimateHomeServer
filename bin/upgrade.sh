#!/usr/bin/env bash

helm upgrade -f values.yaml -f secrets.yaml  "$1" .

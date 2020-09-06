#!/bin/sh

# will throw error if variable is unset
set -eu
# curl command to ping the url specified in github secrets
curl -i --head $URL
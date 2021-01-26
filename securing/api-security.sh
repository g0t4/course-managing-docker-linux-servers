#!/bin/bash


# based on samples: 
  # https://docs.docker.com/engine/api/sdk/#sdk-and-api-quickstart
  # https://docs.docker.com/engine/api/sdk/examples/
# brew install jq # macOS
# apt install jq # ubuntu

curl --silent \
  -X POST http://192.168.30.101:2375/v1.41/images/create?fromImage=alpine&tag=latest

# launch containers!
curl --silent \
  -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http://192.168.30.101:2375/v1.41/containers/create?name=foo

# query list of running containers
curl --silent \
  -X GET http://192.168.30.101:2375/containers/json \
  | jq ".[].Names"

# exit from getdc and run:
curl --silent -X GET http://192.168.30.101:2375/images/json | jq

# with curl+unix-socket the hostname "localhost" in  "http://localhost" can be whatever



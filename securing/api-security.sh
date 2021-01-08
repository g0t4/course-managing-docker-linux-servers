#!/bin/bash


# based on samples: 
  # https://docs.docker.com/engine/api/sdk/#sdk-and-api-quickstart
  # https://docs.docker.com/engine/api/sdk/examples/

curl --unix-socket /var/run/docker.sock \
  -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http://localhost/v1.41/containers/create?name=foo

# query list of running containers
curl --unix-socket /var/run/docker.sock \
  -X GET http://localhost/containers/json \
  | jq ".[].Names"


# with curl+unix-socket the hostname "localhost" in  "http://localhost" can be whatever
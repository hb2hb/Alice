#!/bin/bash

docker network create \
  --driver=bridge \
  --subnet="192.168.77.0/24" \
  --ip-range="192.168.77.0/28" \
  --gateway="192.168.77.1" \
  br0

docker run -d -i --rm --name=alpine --network=br0 --ip="192.168.77.4" alpine

# docker network connect br0 alpine


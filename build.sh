#!/usr/bin/env bash

docker build --platform=linux/amd64 -t scratchx .
docker save scratchx | gzip > scratchx.tgz

docker tag scratchx markmcculloh/scratchx:latest
docker push markmcculloh/scratchx:latest

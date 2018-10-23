#!/bin/sh

IMAGE_TAG=$1
if [ -z "$IMAGE_TAG" ];
then
  IMAGE_TAG=latest
fi

docker build -t trustlab/cd-hello:$IMAGE_TAG .

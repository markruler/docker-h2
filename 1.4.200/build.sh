#!/usr/bin/env bash

IMAGE_REPOSITORY=markruler
IMAGE_NAME=h2
IMAGE_TAG=1.4.200

REMOTE=$IMAGE_REPOSITORY/$IMAGE_NAME:$IMAGE_TAG

sudo docker build \
  --force-rm=true \
  --no-cache=true \
  --tag=$IMAGE_REPOSITORY/$IMAGE_NAME .

sudo docker tag $IMAGE_REPOSITORY/$IMAGE_NAME $REMOTE

sudo docker push $IMAGE_REPOSITORY/$IMAGE_NAME # latest
sudo docker push $REMOTE

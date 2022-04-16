#!/usr/bin/env bash

IMAGE_REPOSITORY=markruler
IMAGE_NAME=h2
IMAGE_TAG=1.4.200

REMOTE=$IMAGE_REPOSITORY/$IMAGE_NAME:$IMAGE_TAG

# docker build --force-rm=true --no-cache=true --tag=markruler/h2 .
sudo docker build \
  --force-rm=true \
  --no-cache=true \
  --tag=$IMAGE_REPOSITORY/$IMAGE_NAME .

# docker tag markruler/h2 markruler/h2:1.4.200
sudo docker tag $IMAGE_REPOSITORY/$IMAGE_NAME $REMOTE

# docker push markruler/h2
sudo docker push $IMAGE_REPOSITORY/$IMAGE_NAME # latest
# docker push markruler/h2:1.4.200
sudo docker push $REMOTE

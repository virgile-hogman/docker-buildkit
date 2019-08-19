#!/bin/bash

set -x

./clean.sh

set -e

DOCKER_BUILDKIT=1 docker build -t bk1 --no-cache src1
DOCKER_BUILDKIT=1 docker build -t bk2 --no-cache src2

docker build -t bk1 --no-cache --iidfile bk1.id src1
id1=$(cat bk1.id)
docker build -t bk2 --no-cache --build-arg BASE_IMAGE=$id1 src-custom

DOCKER_BUILDKIT=1 docker build -t bk1 --no-cache --iidfile bk1.id src1
id1=$(cat bk1.id)
DOCKER_BUILDKIT=1 docker build -t bk2 --no-cache --build-arg BASE_IMAGE=$id1 src-custom


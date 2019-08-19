#!/bin/bash

set -x

./clean.sh

docker run --name buildkit -d --privileged -p 1234:1234 moby/buildkit --addr tcp://0.0.0.0:1234
export BUILDKIT_HOST=tcp://0.0.0.0:1234

set -e

buildctl build --frontend dockerfile.v0 --progress=plain \
	--local context=src1 \
	--local dockerfile=src1 \
	--output type=docker,name=bk1 | docker load

buildctl build --frontend dockerfile.v0 --progress=plain \
        --local context=src2 \
        --local dockerfile=src2 \
        --output type=docker,name=bk2 | docker load

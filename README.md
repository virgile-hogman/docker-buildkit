# Buildkit issues

Two setups with different issues.

## docker build

docker-build.sh: using `docker build` with or without `DOCKER_BUILDKIT=1`


### Local build

- DOCKER_BUILDKIT=1 docker build from local image OK
- docker build from local SHA-ID OK
- DOCKER_BUILDKIT=1 docker build from local SHA ID **FAIL**

### Cache
- docker build `--cache-from` working fine both with local image or SHA ID OK
- DOCKER_BUILDKIT=1 with local image **FAIL**: https://github.com/moby/moby/issues/39003
- DOCKER_BUILDKIT=1 with SHA ID **TBD** (not relevant yet)


## buildctl

buildctl-build.sh: using `buildctl` (https://github.com/moby/buildkit)

### Local build

- builtctl build from local image **FAIL**
- tests with SHA-ID **TBD** (not relevant yet)

### Cache

- issues with local cache: https://github.com/moby/moby/issues/39003
- possibly more tests to come

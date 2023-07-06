#!/bin/bash
set -e

DOCKER_SOCKET_PATH=/var/run/docker.sock
DOCKER_NETWORK_NAME=sample-app-network
DOCKER_NIX_STORE_MOUNT=nix-store
DOCKER_NIX_DB_MOUNT=nix-db
DOCKER_CONTAINER_NAME=ndev
DOCKER_APP_SOURCE=./sample-app

docker network inspect "$DOCKER_NETWORK_NAME" > /dev/null || \
	docker network create -d bridge "$DOCKER_NETWORK_NAME"

# TODO: Connect to existing container if it exists
exec docker run --rm -it \
	--network=$DOCKER_NETWORK_NAME \
	--mount "type=bind,src=${DOCKER_SOCKET_PATH},target=/var/run/docker.sock" \
	--mount "type=bind,src=${DOCKER_APP_SOURCE},target=/app/" \
	--mount "type=volume,src=${DOCKER_NIX_STORE_MOUNT},target=/nix/store/" \
	--mount "type=volume,src=${DOCKER_NIX_DB_MOUNT},target=/nix/var/nix/db/" \
	ndev /bin/ndev-shell

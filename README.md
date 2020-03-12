# Dockerfiles

Repository with Generic Dockerfiles

Trying to standardize the way I build Dockerfiles

## Build the image

```bash
# Registry Path
REGISTRY=local
IMAGE_NAME=flaskk_simple:latest
BUILD_TAG=${REGISTRY}/${IMAGE_NAME}

docker build --tag ${BUILD_TAG} .
```

## Push to Registry

```bash
# Push to registry
docker push ${BUILD_TAG}
```

## Run & Access

```bash
NAME='test_ubuntu'
# Run New Container, terminal + interactive + detached
docker run -tid --name ${NAME} ${BUILD_TAG} bash
# Access
docker exec -ti ${NAME} bash

# Stop & Delete
docker stop ${NAME} && docker rm ${NAME}
```

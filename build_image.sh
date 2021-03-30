#!/bin/bash

#Fail if one script fails
set -e

#Change to local script dir
cd "$(dirname "$0")"

BUILD_NUMBER="${BUILD_NUMBER:-local}"
ARTIFACT_NAME="teamviewer"
REGISTRY="registry.hans-fischer.com"

echo "Building: $ARTIFACT_NAME:"$BUILD_NUMBER

docker build \
    --pull \
    -t $ARTIFACT_NAME:$BUILD_NUMBER \
    .

if [[ ${BUILD_NUMBER} != "local" ]];then
    docker tag $ARTIFACT_NAME:$BUILD_NUMBER $REGISTRY/$ARTIFACT_NAME:$BUILD_NUMBER
    docker push $REGISTRY/$ARTIFACT_NAME:$BUILD_NUMBER
    echo "Published as: $REGISTRY/$ARTIFACT_NAME:"$BUILD_NUMBER
fi

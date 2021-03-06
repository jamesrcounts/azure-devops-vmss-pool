#!/bin/bash -e
################################################################################
##  File:  docker-moby.sh
##  Desc:  Installs docker onto the image
################################################################################
set -euo pipefail

# Check to see if docker is already installed
docker_package=moby
echo "Determing if Docker ($docker_package) is installed"
if ! IsPackageInstalled $docker_package; then
    echo "Docker ($docker_package) was not found. Installing..."
    apt-get remove -y moby-engine moby-cli
    apt-get update
    apt-get install -y moby-engine moby-cli
    apt-get install --no-install-recommends -y moby-buildx
else
    echo "Docker ($docker_package) is already installed"
fi

# Enable docker.service
systemctl is-active --quiet docker.service || systemctl start docker.service
systemctl is-enabled --quiet docker.service || systemctl enable docker.service

# Docker daemon takes time to come up after installing
sleep 10
docker info

# Pull images
declare -a images=(
    "mcr.microsoft.com/dotnet/runtime:5.0"
    "mcr.microsoft.com/dotnet/sdk:5.0"
    )
for image in $images; do
    docker pull "$image"
done
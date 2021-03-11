#!/bin/bash -e
################################################################################
##  File:  basic.sh
##  Desc:  Installs basic command line utilities and dev packages
################################################################################
declare -a cmd_packages=(
    "jq"
    "unzip"
)

for package in "${cmd_packages[@]}"; do
    echo "Install $package"
    apt-get install -y --no-install-recommends $package
done
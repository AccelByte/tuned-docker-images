#!/bin/bash

if [[ $# -ne 3 ]]; then
  echo "This script needs base image, base image version, and node version as arguments"
  echo "example : ./build.sh alpine 3.11 10.15.3"
  echo "example : ./build.sh debian 3.11 10.15.3"
  exit -1
fi

sed -e "s/<nodeversion>/${3}/g" -e "s/<base_image_version>/${2}/g" Dockerfile.${1} > Dockerfile
docker build -t accelbyte/node:${3}-${1}-${2} .
docker tag accelbyte/node:${3}-${1}-${2} accelbyte/node:latest

rm -rf Dockerfile

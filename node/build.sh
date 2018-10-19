#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "This script needs base image and node version as arguments"
  echo "example : ./build.sh alpine 8.12.0"
  echo "example : ./build.sh debian 8.12.0"
  exit -1
fi

sed "s/<nodeversion>/${2}/g" Dockerfile.${1} > Dockerfile
docker build -t accelbyte/node:${2}-${1} .
docker tag accelbyte/node:${2}-${1} accelbyte/node:latest

rm -rf Dockerfile

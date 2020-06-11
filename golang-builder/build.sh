#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "This script needs goversion and alpine version as arguments"
  echo "example : ./build.sh 1.13 3.11"
  exit -1
fi

sed -e "s/<goversion>/${1}/g" -e "s/<base_image_version>/${2}/g" Dockerfile.template > Dockerfile
docker build -t accelbyte/golang-builder:${1}-alpine${2} .
docker tag accelbyte/golang-builder:${1}-alpine${2} accelbyte/golang-builder:latest

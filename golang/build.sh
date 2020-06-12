#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "This script needs golang version and linterversion as argument"
  echo "example : ./build.sh -g 1.13 -l 1.20.0 -b 3.11"
  exit -1
fi

while getopts g:l:b: option
do
  case "${option}"
    in
    g) goversion=${OPTARG};;
    l) linterversion=${OPTARG};;
    b) base_image_version=${OPTARG};;
  esac
done

sed -e "s/<goversion>/${goversion}/g" \
-e "s/<linterversion>/${linterversion}/g" \
-e "s/<base_image_version>/${base_image_version}/g" \
Dockerfile.template > Dockerfile
docker build -t accelbyte/golang:${goversion}-alpine${base_image_version} .
docker tag accelbyte/golang:${goversion}-alpine${base_image_version} accelbyte/golang:latest

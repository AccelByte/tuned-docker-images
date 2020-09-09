#!/bin/bash
base_image_version='3.12'

while getopts b:h option
do
  case "${option}"
    in
    b) base_image_version=${OPTARG};;
    h) echo "script usage: $(basename $0) [-h] [-b base-image-version-default-is-3.12]" >&2 ; exit 1 ;;
    esac
done

sed -e "s/<base_image_version>/${base_image_version}/g" \
Dockerfile.template > Dockerfile

docker build -t accelbyte/alpine:${base_image_version} .
docker tag accelbyte/alpine:${base_image_version} accelbyte/alpine:latest


#!/bin/bash
goversion='1.14'
base_image_version='3.12'

while getopts g:b:h option
do
  case "${option}"
    in
    g) goversion=${OPTARG};;
    b) base_image_version=${OPTARG};;
    h) echo "script usage: $(basename $0) [-h] [-g goversion-default-1.14] [-b base-image-version-default-is-3.12]" >&2 ; exit 1 ;;
  esac
done

sed -e "s/<goversion>/${goversion}/g" -e "s/<base_image_version>/${base_image_version}/g" Dockerfile.template > Dockerfile
docker build -t accelbyte/golang-builder:${goversion}-alpine${base_image_version} .
docker tag accelbyte/golang-builder:${goversion}-alpine${base_image_version} accelbyte/golang-builder:latest


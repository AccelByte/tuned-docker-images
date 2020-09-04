#!/bin/bash
goversion='1.14'
linterversion='1.30.0'
base_image_version='3.12'

while getopts g:l:b:h option
do
	case "${option}"
		in
		g) goversion=${OPTARG};;
		l) linterversion=${OPTARG};;
		b) base_image_version=${OPTARG};;
		h) echo "script usage: $(basename $0) [-h] [-g goversion-default-1.14] [-l linterversion-default-1.30.0] [-b base-image-version-default-is-3.12]" >&2 ; exit 1 ;;
	esac
done

sed -e "s/<goversion>/${goversion}/g" \
-e "s/<linterversion>/${linterversion}/g" \
-e "s/<base_image_version>/${base_image_version}/g" \
Dockerfile.template > Dockerfile
docker build -t accelbyte/golang:${goversion}-alpine${base_image_version} .
docker tag accelbyte/golang:${goversion}-alpine${base_image_version} accelbyte/golang:latest


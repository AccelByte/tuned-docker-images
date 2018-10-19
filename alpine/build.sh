#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "This script needs version as argument"
  echo "example : ./build.sh 3.8"
  exit -1
fi

readonly alpine_baseurl=http://dl-cdn.alpinelinux.org/alpine/
readonly arch_url=${alpine_baseurl}v${1}/releases/x86_64/
wget ${arch_url}latest-releases.yaml
readonly filename=`cat latest-releases.yaml | grep file | grep minirootfs | awk '{print $2}'`
wget ${arch_url}${filename}

docker build -t accelbyte/alpine:${1} .
docker tag accelbyte/alpine:${1} accelbyte/alpine:latest

rm -rf *.yaml*
rm -rf *.tar.gz*

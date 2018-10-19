#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "This script needs version as argument"
  echo "example : ./build.sh 8"
  echo "example : ./build.sh 9"
  echo "example : ./build.sh 11"
  exit -1
fi

sed -i "s/<version>/${1}/g" Dockerfile
docker build -t accelbyte/openjdk:${1}-debian .

sed -i "s/${1}/<version>/g" Dockerfile

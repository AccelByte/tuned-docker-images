#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "This script needs version as argument"
  echo "example : ./build.sh 1.11.1"
  exit -1
fi

sed -i "s/<goversion>/${1}/g" Dockerfile
docker build -t accelbyte/golang-builder:${1} .
docker tag accelbyte/golang-builder:${1} accelbyte/golang-builder:latest

sed -i "s/${1}/<goversion>/g" Dockerfile

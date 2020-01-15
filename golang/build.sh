#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "This script needs golang version and linterversion as argument"
  echo "example : ./build.sh -g 1.11.1 -l 1.17.1"
  exit -1
fi

while getopts g:l: option
do
  case "${option}"
  in
  g) goversion=${OPTARG};;
  l) linterversion=${OPTARG};;
  esac
done

sed -i "s/<goversion>/${goversion}/g" Dockerfile
sed -i "s/<linterversion>/${linterversion}/g" Dockerfile
docker build -t accelbyte/golang:${goversion} .
docker tag accelbyte/golang:${goversion} accelbyte/golang:latest

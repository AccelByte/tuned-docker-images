#!/bin/bash

if ! [[ -x "$(command -v debootstrap)" ]]; then
  echo 'Error: debootstrap is not installed.' >&2
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
   echo "You must be root to do this." 1>&2
   exit 1
fi

readonly current_dir=`pwd`

mkdir /fs
debootstrap \
  --variant=minbase \
  stable /fs http://cdn-fastly.deb.debian.org/debian/

cd /fs
tar -cvf ${current_dir}/rootfs.tar.gz *
cd ${current_dir}

docker build -t accelbyte/debian:stable .
docker tag accelbyte/debian:stable accelbyte/debian:latest

rm -rf *.tar.gz*

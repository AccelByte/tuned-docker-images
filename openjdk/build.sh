#!/bin/bash

function usage() {
cat << EOF
Execute this script under the same directory
  Example :
    ./build.sh -j [hotspot/openj9] -o [jdk/jre (Kit option)] -v [8/11 (Java version)] -a [3.9 (alpine base image version from Accelbyte's docker hub)] -t [image tag]
EOF
  exit 0
}

function check_args() {

if [[ -z ${jvm_variant} ]] || [[ -z ${kit_option} ]] || [[ -z ${java_version} ]] || [[ -z ${alpine_version} ]] || [[ -t ${tag} ]]; then
  echo "This script needs complete argument. Please use -h flag to see usage."
  usage
  exit 1
fi

if [[ "${kit_option}" != "jdk" && "${kit_option}" != "jre" ]]; then
  echo "The kit option is either jdk or jre"
  echo "Please use -h flag to see usage."
  exit 1
fi

if [[ ${java_version} != "8" && ${java_version} != "11" ]] ; then
  echo "The supported java version is 8 or 11"
  echo "Please use -h flag to see usage."
  exit 1
fi

}

function configure_and_build_dockerfile() {
  
  if [[ ${jvm_variant} == "openj9" ]]; then
    dockerfile_path="$PWD/OpenJ9/${java_version}/Dockerfile.${kit_option}.alpine"
  elif [[ ${jvm_variant} == "hotspot" ]]; then
    dockerfile_path="$PWD/HotSpot/${java_version}/Dockerfile.${kit_option}.alpine"
  else
    echo "we don't support that variant. Please use either openj9 or hotspot"
    echo "Please check usage with -h"
    exit 1
  fi

  sed -i "s#<alpine_version>#${alpine_version}#g" ${dockerfile_path}
  docker build -t accelbyte/openjdk:${tag} -f ${dockerfile_path} .

}

function main() {
  while getopts j:o:v:a:t:h option
  do
    case "${option}"
      in
      j) jvm_variant=${OPTARG};;
      o) kit_option=${OPTARG};;
      v) java_version=${OPTARG};;
      a) alpine_version=${OPTARG};;
      t) tag=${OPTARG};;
      h) usage;;
    esac
  done
  check_args
  configure_and_build_dockerfile
}

main "$@"
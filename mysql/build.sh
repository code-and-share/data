#!/usr/bin/env bash

if [ -z $1 ]; then
  echo "ERROR: No version provided."
  echo " Syntax: "$0" vX.YY"
  exit 2
fi

sudo rm -rf mysql_data
ID=$(docker build -q -t cns_mysql:$1 .)
docker tag $ID angelalonso/cns_mysql:$1
docker push angelalonso/cns_mysql:$1

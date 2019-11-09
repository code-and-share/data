#!/usr/bin/env bash

if [ -z $1 ]; then
  echo "ERROR: No docker hub user provided."
  echo " Syntax: "$0" username vX.YY"
  exit 2
fi

if [ -z $2 ]; then
  echo "ERROR: No version provided."
  echo " Syntax: "$0 $1" vX.YY"
  exit 2
fi

sudo rm -rf mysql_data
ID=$(docker build -q -t cns_mysql:$2 .)
docker tag $ID $1/cns_mysql:$2
docker push $1/cns_mysql:$2

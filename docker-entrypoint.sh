#!/bin/sh

if [ "$OC_HOST" = ""]
then
  /registry.sh $1
else
  /registry.sh $1 &
  /oc-connect.sh
fi

#!/bin/bash

OPENCONNECT_PID=""

function startOpenConnect(){
  echo "$(date) start openconnect"
  echo "$OC_PASSWORD" | openconnect -b "$OC_HOST" -u "$OC_USER" --passwd-on-stdin --non-inter
  OPENCONNECT_PID=$(pidof openconnect)
  echo "$(date) openconnect pid: $OPENCONNECT_PID"
  i="0"
}


function checkOpenConnect(){
  OPENCONNECT_STATUS="nil"
  #kill -0 $OPENCONNECT_PID
  OPENCONNECT_STATUS="$(pidof openconnect)"

  if [ "$OPENCONNECT_STATUS" = "" ]
  then
    OPENCONNECT_STATUS="-1"
  fi
}

startOpenConnect

sleep 5

i="0"
while :
do
  sleep 60
  
  if [ ! -z "$OC_MAXDUR" ]
  then
    if [ $i -gt $OC_MAXDUR ]
    then
      echo "$(date) killing openconnect OC_MAXDUR reached!"
      kill -SIGHUP $OPENCONNECT_PID
      sleep 5
      i="0"
    fi
  fi

  checkOpenConnect

  if [ "$OPENCONNECT_STATUS" = "$OPENCONNECT_PID" ];
  then
    echo "$(date) openconnect is alive"
  else
    echo "$(date) restarting dead openconnect. status: $OPENCONNECT_STATUS"
    sleep 1
    startOpenConnect  
  fi
  
  i=$[$i+1]
done

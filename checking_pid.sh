#!/usr/bin/env /bin/bash

echo "Enter PID"

read pid

func_pid () 
{
ps -d | grep $pid

case $? in
  0) echo "PID is running";;
  1) echo "PID is not running";;
  *) echo "PID is not running";;
esac

}

while :
do
  func_pid
  sleep 5
done
exit 0

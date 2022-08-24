#!/usr/bin/env /bin/bash


if [[ $# -ne 1 ]]
  then
    echo "Type var"
    exit 1
fi

expr $1 + 0 &>/dev/null

if [[ $? -eq 0 ]] 
then
  echo "integer"
else
  echo "not integer"
fi
exit 0

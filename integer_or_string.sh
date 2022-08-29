#!/usr/bin/env /bin/bash

#Write a script function that determines if an argument passed to it is an integer or a string. The
#function will return TRUE (0) if passed an integer, and FALSE (1) if passed a string.
#Hint: What does the following expression return when $1 is not an integer?

expr $1 + 0

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

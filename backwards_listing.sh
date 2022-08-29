#!/usr/bin/env /bin/bash

#Write a script that echoes itself to stdout, but backwards

filename='backwards_listing.sh'

array=()

while read line
do
  array+=($line)
  #echo ${array[@]}
done < $filename

count=${#array[@]}
echo $count
while [[ $count -ge 0 ]]
do
  echo "${array[$count]}"
  count=$(( $count -1 ))
done
exit 0

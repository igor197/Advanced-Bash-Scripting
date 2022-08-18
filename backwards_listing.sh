#!/usr/bin/env /bin/bash

filename='backwards_listing.sh'

array=()

while read line
do
  array+=($line)
  #echo ${array[@]}
done < $filename

#echo "${array[@]}"

#for n in "${array[@]}";do
#  echo $n
#done


count=${#array[@]}
echo $count
while [[ $count -ge 0 ]]
do
  echo "${array[$count]}"
  count=$(( $count -1 ))
done
exit 0

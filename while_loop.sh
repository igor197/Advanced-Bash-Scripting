#!/usr/bin/env /bin/bash

#Convert the for loops in Example 11-1 to while loops. Hint: store the data in an array and step through
#the array elements.

solar_system=( Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto )

n=0
count=${#solar_system[@]}

while [[ $n -lt $count ]] 
do
  echo ${solar_system[$n]}
  n=$(( $n + 1 ))
done 

exit 

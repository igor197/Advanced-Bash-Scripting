#!/usr/bin/env /bin/bash

solar_system=( Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto )

n=0
count=${#solar_system[@]}

while [[ $n -le $count ]] 
do
  echo ${solar_system[$n]}
  n=$(( $n + 1 ))
done 

exit 

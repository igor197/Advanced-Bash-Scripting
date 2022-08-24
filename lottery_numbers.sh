#!/usr/bin/env /bin/bash

win_numbers=()
count = 0
filename="win_numbers.txt"

while [[ $count -le 5 ]]
  do
    number=$RANDOM
    if [[ $number -le 50 ]]
      then
      win_numbers+=($number)
      count=$(($count + 1))
    fi
  done

echo ${win_numbers[@]}
echo "If you want to write winners number in the file, press 1"
echo "If you want of echoing the numbers to stdout, press 2"

read line

case $line in
  1) echo ${win_numbers[@]} > $filename | echo "Numbers was write to file $filename";;
  2) echo ${win_numbers[@]};;
  *) echo "Wrong choice";;
esac
 
exit 0

  

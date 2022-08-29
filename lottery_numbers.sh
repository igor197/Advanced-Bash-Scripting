#!/usr/bin/env /bin/bash

#One type of lottery involves picking five different numbers, in the range of 1 - 50. Write a script that
#generates five pseudorandom numbers in this range, with no duplicates. The script will give the
#option of echoing the numbers to stdout or saving them to a file, along with the date and time the
#particular number set was generated. (If your script consistently generates winning lottery numbers,
#then you can retire on the proceeds and leave shell scripting to those of us who have to work for a
#living.)

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

  

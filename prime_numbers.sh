#!/usr/bin/env /bin/bash

START_TIME=$(date +%s)
array=()

for n in {60000..63000}
do
count=0
  for ((i=2; i<$n; ++i))
    do
      let "a=$n % $i"
      if [[ $a -eq 0 ]]
        then
        count=$(($count +1))
        break
      fi
    done
if [[ $count -eq 0 ]]
then
  array+=($n)
  fi
done
echo ${array[@]}
                                                                     
END_TIME=$(date +%s)
DIFF=$(( $END_TIME - $START_TIME ))
echo "It took $DIFF seconds"
exit

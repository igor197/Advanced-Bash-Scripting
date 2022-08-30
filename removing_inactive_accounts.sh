#!/usr/bin/env /bin/bash

days=20
seconds_in_days=$(( 86400 * $days  ))
seconds_current=$(date +%s)
count=0


lastlog | grep -v "Never" > users_file

while IFS='\n' read line 
  do
    count_word=$(echo $line | wc -w)
    if [[ $line != *"Username"* ]]
    then
      if [[ $count_word -eq 9 ]]
      then
         username=$(echo $line | cut -d' ' -f1)
         ip=$(echo $line | cut -d' ' -f3)
         month=$(echo $line | cut -d' ' -f5)
         day=$(echo $line | cut -d' ' -f6)
         hhmm=$(echo $line | cut -d' ' -f7)
         year=$(echo $line | cut -d' ' -f9)
         seconds=$(date -d "$month $day $hhmm $year" +%s)
         if [[ $(($seconds_current - $seconds)) -gt $seconds_in_days ]]
         then
           echo "User \"$username\" logged in more than $days days ago"
           echo "Last login $day $month $year $hhmm"
           count=$(($count + 1))
         fi
      elif [[ $count_word -eq 8 ]]
        then
        username=$(echo $line | cut -d' ' -f1)
        month=$(echo $line | cut -d' ' -f4)
        day=$(echo $line | cut -d' ' -f5)
        hhmm=$(echo $line | cut -d' ' -f6)
        year=$(echo $line | cut -d' ' -f8)
        seconds=$(date -d "$month $day $hhmm $year" +%s)
        if [[ $(($seconds_current - $seconds)) -gt $seconds_in_days ]]
        then
          echo "User \"$username\" logged in more than $days days ago"
          echo "Last login $day $month $year $hhmm"
          count=$(($count + 1))
        fi
      fi  
    fi
  done < users_file

  if [[ $count -eq 0 ]]
  then 
    echo "No users logged in more than \"$days\" ago"
  fi

rm -rf users_file
 exit

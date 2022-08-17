#!/usr/bin/env /bin/bash

#Write a script that reads each line of a target file, then writes the line back to stdout, but with an
#extra blank line following. This has the effect of double-spacing the file.
#Include all necessary code to check whether the script gets the necessary command-line argument (a
#filename), and whether the specified file exists.

filename="/root/My_scripts/Advanced_Bash/Advanced-Bash-Scripting/test_backup.txt"

while read line
do
  if [[ -n $line ]];then
    echo $line
    count_line=0
  elif [[ -z $line ]] && [[ $count_line -eq 0 ]];then
    count_line=$(( $count_line + 1 ))
    echo $line 
  fi
done < $filename 
exit


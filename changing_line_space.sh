#!/usr/bin/env /bin/bash

#Write a script that reads each line of a target file, then writes the line back to stdout, but with an
#extra blank line following. This has the effect of double-spacing the file.
#Include all necessary code to check whether the script gets the necessary command-line argument (a
#filename), and whether the specified file exists.
#2 Part exerсises in file 'delete_empty_lines.sh'

if [[ $# -ne 1 ]];then
  echo "Enter file name"
  exit
fi

if [[ ! -e $1 ]];then
  printf "%s\n" "File does not exist"
  exit
fi

filename="$(echo $1 | cut -d. -f1)"
extension="$(echo $1 | cut -d. -f2)"
backupfilename="$filename-backup.$extension"

while read line
do 
  printf "%s\n" "$line" >> $backupfilename 
  echo >> $backupfilename
  echo >> $backupfilename
  echo >> $backupfilename
done < $1 
exit


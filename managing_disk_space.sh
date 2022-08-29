#!/usr/bin/env /bin/bash

#List, one at a time, all files larger than 100K in the /home/username directory tree. Give the user
#the option to delete or compress the file, then proceed to show the next one. Write to a logfile the
#names of all deleted files and the deletion times.


date=$(date +%d-%m-%Y)
hhmm=$(date +%H:%M)

if [[ -z $* ]]
then
  echo "No argument found!"
  echo "Enter 'A' for archive or 'D' for delete filles"
  exit 1
fi

cd /home
for line in $(ls -1)
  do
    if [[ -d $line ]]
    then
      cd /home/$line
      filename=${line#/}
      filename=${filename/\//-}-$date
      findfiles=$(find . -size +100k)
      if [[ -z $findfiles ]]
      then
        echo "Files don't find"
        exit 1
      fi
  case $1 in
    a|A)  tar -czvf $filename.tar.gz ${findfiles[a]};;
    d|D)  echo $date $hhmm > $date.log
          echo ${findfiles[a]} >> $date.log
          for file in ${findfiles[@]}
          do
            cp $file $file.backup
            #rm -rf $file.backup
          done;;
  esac
    fi
cd /home
done
exit
  

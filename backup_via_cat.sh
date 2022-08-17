#!/usr/bin/env /bin/bash

#Write a script that backs itself up, that is, copies itself to a file named
#backup.sh. Hint: Use the cat command and the appropriate positional parameter.

while :

do
if [ $# -ne 1 ]
then 
  echo "Specify the parameter, file name"  
  exit  
else
  file=$(echo $1 | cut -d. -f1)
  extension=$(echo $1 | cut -d. -f2)
  cat $1 > $file'_backup'.$extension
  break
fi

done

echo "Did it"

exit 0
  


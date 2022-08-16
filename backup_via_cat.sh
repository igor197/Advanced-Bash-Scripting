#!/usr/bin/env /bin/bash

#PATH_BACKUP=/root/My_scripts/dirbackup

while :
do
if [ $# -ne 1 ]
then 
    echo "Не указано имя файла для создания его резервной копии \
или указано больше одного параметра"  
    exit  
else
    file=$(echo $1 | cut -d. -f1)
    extension=$(echo $1 | cut -d. -f2)
    #touch $1_backup
    echo $file
    echo $extension
    #touch $file'_backup'.$extension
    cat $1 > $file'_backup'.$extension
    break
fi
done
echo "Did it"
exit 0
  


#!/usr/bin/env /bin/bash

#Perform a recursive direictory listing on the user's home directory and save the information to a file.
#Compress the file, have the script prompt the user to insert a USB flash drive, then press ENTER.
#Finally, save the file to the flash drive after making certain the flash drive has properly mounted by
#parsing the output of df

PathDir=/copy_var_log

#echo "Enter path directory"

#read PathDir

if [ ! -d $PathDir ]; then
  echo "Path dir don't exist"
  echo "Enter new path"
  exit
fi

echo "to be continue"

cd $PathDir

ArchiveFileName="$(echo $PathDir | sed 's/\///1' | sed 's/\//_/g')".tar

echo $ArchiveFileName

tar -cvf $ArchiveFileName -T /dev/null

ListDir="$(ls -1)"

for File in $ListDir
do
  if [ -f $File ]; then
  tar -rvf $ArchiveFileName $File 2>/dev/null 
  fi  
done

#tar -cvzf $ArchiveFileName.gz $ArchiveFileName

echo "Для копирования на USB, подключите носитель и нажмите Y"

read line

case $line in
  Y) echo "USB установлен";;  
esac

usb="$(blkid | tail -1)"

if [[ $usb == *'TYPE="vfat"'* ]];then
  dev_usb="$(echo $usb | cut -d: -f1)"
  #echo $dev_usb
else
  echo "Что-то пошлоо не так. Проверьте правильность подключения USB"
fi

mount $dev_usb /mnt/usb
cd /mnt/usb
#ls -l

cp "$PathDir/$ArchiveFileName" /mnt/usb
echo $?
if [[ $? -eq 0 ]];then
echo "Файл скопирован"
else
echo "Ошибка при копировании, либо файл существует"
fi

exit

  
  





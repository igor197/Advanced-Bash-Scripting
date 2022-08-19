#!/usr/bin/env /bin/bash

#Given a list of filenames as input, this script queries each target file (parsing the output of the file
#command) for the type of compression used on it. Then the script automatically invokes the
#appropriate decompression command (gunzip, bunzip2, unzip, uncompress, or whatever). If a target
#file is not compressed, the script emits a warning message, but takes no other action on that particular
#file.

path_file=/root/My_scripts/testdir_archive
cd $path_file

for line in $(ls -1);do
if [[ $line == *".zip" ]];then 
  unzip $line
elif [[ $line == *".tar.gz" ]];then
  tar -xvzf $line  
fi
done   

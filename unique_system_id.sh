#!/usr/bin/env /bin/bash

#Generate a "unique" 6-digit hexadecimal identifier for your computer. Do not use the flawed hostid
#command. Hint: md5sum /etc/passwd, then select the first 6 digits of output.

_hash=$(md5sum /etc/passwd)
hostid=${_hash:0:6}
echo $hostid

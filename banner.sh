#!/usr/bin/env /bin/bash

#Simulate the functionality of the deprecated banner command in a script

repeat()  {

rep=
message=$1
separator='#'
length_message="${#message}"
length_message="$(( $length_message + 5 ))"
while [[ "${#rep}" -le $length_message ]]
do
  rep=$rep$separator
done

printf "%s\n" "$rep"
printf "%1s %s %1s\n" "${rep:0:2}" "$message" "${rep:0:2}"
printf "%s\n" "$rep"

}

repeat 'THIS IS WARNING'


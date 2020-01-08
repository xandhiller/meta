#! /bin/bash --

# Only run the script if there's an argument
if [ -z "$1" ] 
  then
  return 1
fi

seconds=$1; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ge `date +%s` ]; do 
  echo -ne "  $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
  sleep 0.1
done

#! /bin/sh --

# Only run the script if there's an argument
if [ -z "$1" ] 
  then
  return 1
fi

arg=$(echo $@ | sed 's/ /+/g')
chromium-browser --new-window www.google.com/search?q=define+$arg 2> /dev/null > /dev/null

#! /bin/sh --

# Only run the script if there's an argument
if [ -z "$1" ] 
  then
  return 1
fi

arg=$(echo $@ | sed 's/ /+/g')
chromium-browser --new-window en.wikipedia.org/w/index.php?search=$arg  2> /dev/null > /dev/null

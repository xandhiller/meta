#! /bin/sh --

selection=$(ls ~/Downloads/*.pdf | dmenu -l 50)

if [ -z "$selection" ] 
  then
  return 1
fi

zathura "$selection" 

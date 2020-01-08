#! /bin/bash

dir="/home/polluticorn/Documents/notes"

choice="$( find ~/Documents/notes/ -type f | sed -e "s/\/home\/polluticorn\/Documents\/notes\///g" | sed -e "/Archive*/d" | dmenu -i -l 80 )"

if [ "$choice" = "question!" ]
then
    choice=questions/$(date +%Y_%m_%d__%H_%M)
fi

if [ "$choice" = "date!" ]
then
    choice=Date/$(date +%Y_%m_%d__%H_%M)
fi

# As long as the choice is not NULL then open the note.
if [ "X$choice" != "X" ]
then
    i3-msg exec "st -e nvim $dir/$choice"
fi 
  

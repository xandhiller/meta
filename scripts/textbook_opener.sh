#! /bin/bash

dir="~/Textbooks"

# List the contents of the Textbooks folder but ignore the archive folder.
choice="$(ls ~/Textbooks | dmenu -i -l 40)"

# As long as the choice is not NULL then open the textbook.
if [ "X$choice" != "X" ]
then
  exec zathura "$dir/$choice"
fi
